// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec6 {
    /*
        view : function 밖의 변수들을 읽을 수 있으나 변경 불가능. Readable / No Write
        pure : function 밖의 변수들을 읽지 못하고, 변경도 불가능. No Read / No Write
        view 와 pure 둘다 명시 안할 때 : function 밖의 변수들을 읽어서, 변경을 해야함. Readable / Writable
    */

    // 1. view
    uint256 public a = 1;

    function read_view_a() public view returns (uint256) {
        return a + 2;
    }

    // 2. pure
    function read_pure() public pure returns (uint256) {
        uint256 b = 1;
        return 4 + 2 + b;
    }

    // 3. Nothing
    function read_() public returns (uint256) {
        a = 13;// write a
        return a;
    }
}