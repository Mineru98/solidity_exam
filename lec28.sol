// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// 외부 스마트 컨트렉트를 생성 할 때 : 다른 스마트 컨트렉트를 인스턴스화 생성 할 때 사용함.
contract lec28_character {
    string private name;
    uint256 private power;

    constructor(string memory _name, uint256 _power) {
        // revert("error");
        name = _name;
        power = _power;
    }
}

contract lec28_runner {
    event catchOnly(string _name, string _err);

    function playTryCatch(string memory _name, uint256 _power) public returns (bool) {
        try new lec28_character(_name, _power) {
            // revert("errors in the try/catch block");
            return (true);
        } catch {
            emit catchOnly("catch", "ERROR!!");
            return (false);
        }
        return (false);
    }
}

// 스마트 컨트렉트 내에서 함수를 부를 때 : this를 통해 try/catch를 사용함.
contract lec28_runner_2 {
    event catchOnly(string _name, string _err);

    function simple() public returns(uint256) {
        return 4;
    }

    function playTryCatch() public returns (uint256, bool) {
        try this.simple() returns (uint256, _value) {
            // revert("errors in the try/catch block");
            return (_value, true);
        } catch {
            emit catchOnly("catch", "ERROR!!");
            return (0, false);
        }
        return (0, false);
    }
}