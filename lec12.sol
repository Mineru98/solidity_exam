// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

import "./lec11.sol";

contract lec12_Father {
    uint256 public fatherMoney = 1000;
    function getFatherName() public pure returns (string memory) {
        return "KimSung";
    }
    function getMoney() view virtual public returns (uint256) {
        return fatherMoney;
    }
}

contract lec12_Mother {
    uint256 public motherMoney = 500;
    function getMotherName() public pure returns (string memory) {
        return "LeeJung";
    }
    function getMoney() view virtual public returns (uint256) {
        return motherMoney;
    }
}

contract lec12_Son is lec12_Father, lec12_Mother {
    uint256 public earning = 0;

    function work() public {
        earning += 100;
    }

    function getMoney() public view override(lec12_Father, lec12_Mother) returns (uint256) {
        return fatherMoney + motherMoney + earning;
    }
}