// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
    Payable : 이더/토큰과 상호작용시 필요한 키워드라고 생각하면 된다.
    즉, send, transfer, call을 이용하여, 이더를 보낼때 Payable이라는 키워드가 필요함.
    이 Payable은 주로 함수, 주소, 생성자에 붙여서 사용한다.

    msg.value : 송금 보낸 코인의 값.

    이더를 보내는 3가지 방법
    1. send : 2300 gas를 소비, 성공 여부를 true 또는 false 로 반환한다.
    2. transfer : 2300 gas를 소비, 실패시 에러를 발생
    3. call : 가변적인 gas 소비(gas값 지정 가능), 성공 여부를 true 또는 false 로 반환
            재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 권장.
*/
contract lec32 {

    event howMush(uint256 _value);

    function sendNow(address payable _to) public payable {
        bool send = _to.send(msg.value);
        require(send, "Failed to send either");
        emit howMush(msg.value);
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMush(msg.value);
    }

    function callNow(address payable _to) public payable {
        // ~ 0.7
        // (bool send, ) = _to.call.gas(1000).value(msg.value);
        // require(send, "Failed to send either");

        // 0.7 ~
        // (bool send, ) = _to.call{value : msg.value, gas: 1000}("");
        (bool send, ) = _to.call{value : msg.value}("");
        require(send, "Failed to send Either");
        emit howMush(msg.value);
    }
}