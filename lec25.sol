// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// require, revert, assert, try/catch
contract lec25 {
    /*
        0.4.22 ~ 0.7.x
        assert : gas를 다 소비한 후, 특정한 조건에 부합하지 않으면(false일 때) 에러를 발생시킨다.
        revert : 조건없이 에러를 발생시키고, gas를 환불 시켜준다.
        require : 특정한 조건에 부합하지 않으면(false일 때) 에러를 발생시키고, gas를 환불 시켜준다.
    */

    // 3000000 gas
    function assertNow() public pure {
        assert(false); // test 영도로 사용함. truffle에서도 사용
    }

    // 21322 gas
    function revertNow() public pure {
        revert("error!");
    }

    // 21338 gas
    function requireNow() public pure {
        require(false, "occurred");
    }

    function onlyAdults(uint256 _age) public pure returns(string memory) {
        if (_age < 19) {
            revert("You are not allowed to pay for the cigarette");
        } else {
            return "Your payment is scceeded";
        }
    }

    function onlyAdults2(uint256 _age) public pure returns(string memory) {
        // require의 조건이 false 일 경우에 에러 발생하는 점을 유념하자.
        require(_age > 19, "You are not allowed to pay for the cigarette");
        return "Your payment is scceeded";
    }
}