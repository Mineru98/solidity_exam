// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;


contract lec34_MobileBanking {
    // 특정 주소에게만 권한 주기
    address owner;

    // payable을 생성자에 넣을 때
    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only Owner!");
        _;
    }

    event sendInfo(address _msgSender, uint256 _currentValue);
    event myCurrentValue(address _msgSender, uint256 _value);
    event currentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public onlyOwner payable {
        require(msg.sender.balance >= msg.value, "Your balance is not enouth");
        _to.transfer(msg.value);
        emit sendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNoe() public onlyOwner {
        emit myCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public onlyOwner {
        emit currentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}