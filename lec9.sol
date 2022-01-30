// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
    이더리움에서는 하나의 블럭 당 높은 처리를 하면 해당 스마트 컨트렉트는 사용 금지 처분을 받기 때문에
    하나의 블록에 너무 많은 처리량이 있어서는 안된다.
    이러한 문제를 해결하는 디자인 패턴으로 Clone/Factory Pattern 이 있다.
*/

contract lec9_A {
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }

    function set_lec9_A(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }
}

contract lec9_B {
    lec9_A instance = new lec9_A("Alice", 25);

    function get() public view returns (string memory, uint256) {
        return (instance.name(), instance.age());
    }

    function set(string memory _name, uint256 _age) public {
        instance.set_lec9_A(_name, _age);
    }
}