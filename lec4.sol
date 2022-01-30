// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec4 {
    /*
        function {이름} () {접근제어자} {
            {내용}
        }
    */

    uint256 public a = 3;
    // 1. Parameter와 Return 값이 없는 function 정의
    function func_1 () public {
        a = 5;
    }

    // 2. Parameter는 있고 Return 값이 없는 function 정의
    function func_2 (uint256 _value) public {
        a = _value;
    }

    // 3. Parameter도 있고 Return 값도 있는 function 정의
    function func_3 (uint256 _value) public returns (unint256) {
        a = _value;
        return a;
    }
}