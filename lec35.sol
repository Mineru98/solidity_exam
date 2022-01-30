// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
    0.6 이전의 fallback
    fallback 함수는 이름 그대로 대비책 함수이다.

    특징
    1. 무기명 함수, 이름이 없는 함수.
    2. external 필수
    3. payable

    왜 쓰는가?
    1. 스마트 컨트렉트가 이더를 받을 수 있게 한다.
    2. 이더를 받고 난 후 어떠한 행동을 취하게 할 수 있다.
    3. call 함수로 없는 함수가 불려질 때, 어떠한 행동을 취하게 할 수 있다.

    function() external payable {}

    0.6 이후 fallback
    fallback은 recevie와 fallback으로 두가지 형태로 나뉘게 되어있다.

    receive는 순수하게 이더만 받을 때 작동한다.
    fallback은 함수를 실행하면서 이더를 보낼때, 불려진 함수가 없을 때 작동한다.

    기본형 : 불려진 함수가 특정 스마트 컨트렉트가 없을 때 fallback 함수가 발동한다.
    fallback() external {
    }

    payable 적용시 : 이더를 받고 나서도 fallback 함수가 발동함.
    fallback() external payable {
    }

    receive() external payable {
    }
*/

contract lec35_Bank {
    event justFallback(address _from, string message);
    event recevieFallback(address _from, uint256 _value, string message);
    event justFallbackWithFunds(address _from, uint256 _value, string message);
    // ~ 0.6
    // function() external payable {
    //    emit justFallbackWithFunds(msg.sender, msg.value, "justFallbackWithFunds is called");
    // }

    // 0.6 ~
    fallback() external {
        emit justFallback(msg.sender, "justFallback is called");
    }

    receive() external {
        emit recevieFallback(msg.sender, msg.value, "recevieFallback is called");
    }

    // fallback() external payable {
    //    emit justFallbackWithFunds(msg.sender, msg.value, "justFallbackWithFunds is called");
    // }
}

contract lec35_You {
    // receive()
    function DepositWithSend(address payable _to) public payable {
        bool success = _to.send(msg.value);
        require(success, "Failled");
    }

    function DepositWithTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function DepositWithCall(address payable _to) public payable {
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent, "Failed to send either");

        // 0.7 ~
        // (bool sent, ) = _to.call{value: msg.value}("");
        // require(sent, "Failled");
    }

    // fallback()
    function justGiveMessage(address _to) public {
        // ~ 0.7
        (bool sent, ) = _to.call("Hi");
        require(sent, "Failed to send either");

        // 0.7 ~
        // (bool success, ) = _to.call("Hi");
        // require(success, "Failled");
    }

    // To the fallback() with Funds
    function justGiveMessageWithFunds(address payable _to) public payable {
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("Hi");
        require(sent, "Failed to send either");
        // 0.7 ~
        // (bool success, ) = _to.call{value: msg.value}("Hi");
        // require(success, "Failled");
    }
}