// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec14 {
    event numberTracker1(uint256 num, string str);
    event numberTracker2(uint256 indexed num, string str);

    uint256 num = 0;

    function pushEvent(string memory _str) public {
        emit numberTracker1(num, _str);
        emit numberTracker2(num, _str);
        num++;
    }
}