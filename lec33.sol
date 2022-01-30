// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;


/*
    주소.balance : 해당 특정 주소의 현재 갖고 있는 이더의 잔액을 나타낸다. (msg.value는 송금액)

    msg.sender : 스마트 컨트렉트를 사용하는 주체라고 볼 수 있다.
                msg.sender는 앞으로 설명해야 할 call vs delegate call에서 주요 내용이다.
*/

contract lec33_MobileBanking {
    event sendInfo(address _msgSender, uint256 _currentValue);
    event myCurrentValue(address _msgSender, uint256 _value);
    event currentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public payable {
        require(msg.sender.balance >= msg.value, "Your balance is not enouth");
        _to.transfer(msg.value);
        emit sendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNoe() public {
        emit myCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public {
        emit currentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}