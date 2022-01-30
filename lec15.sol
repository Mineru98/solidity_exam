// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec15_Father {
    event fatherName(string name);

    function who() public virtual {
        emit fatherName("KindDaeho");
    }
}

contract lec15_Son is lec15_Father {
    event sonName(string name);

    function who() public override {
        super.who();
        emit sonName("KinJin");
    }
}