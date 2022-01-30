// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec19 {
    uint256 num = 89;
    mapping(uint256=>uint256) numMap;
    uint256[] numArray;

    function changeNum(uint256 _num) public {
        num = _num;
    }

    function getNum() public view returns (uint256) {
        return num;
    }

    function numMapAdd() public {
        numMap[0] = num;
    }

    function getNumMap() public view returns (uint256) {
        return numMap[0];
    }

    function updateMap() public {
        numMap[0] = num;
    }

    function numArrayAdd() public {
        numArray.push(num);
    }

    function getNumArray() public view returns (uint256) {
        return numArray[0];
    }

    function updateArray() public {
        numArray[0] = num;
    }
}