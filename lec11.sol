// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec11_Father {
    string public familyName = "Kim";
    string public givenName = "Sung";
    uint256 public money = 100;

    constructor(string memory _givenName) public {
        givenName = _givenName;
    }

    function getFamilyName() view public returns (string memory) {
        return familyName;
    }

    function getGivenName() view public returns (string memory) {
        return givenName;
    }

    function getMoney() view virtual public returns (uint256) {
        return money;
    }
}

contract lec11_Son is lec11_Father {
    uint256 public earning = 0;

    constructor() lec11_Father("Jony") {
    }

    function work() public {
        earning += 100;
    }

    function getMoney() view override public returns (uint256) {
        return money + earning;
    }
}