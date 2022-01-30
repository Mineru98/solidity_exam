// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5 {
    /*
        function {이름} () {접근제어자} {
            {내용}
        }
    */
    /*
        접근제어자 - function / var
        public : 모든곳에서 접근 가능. 동일한 컨트렉트가 아닌 다른 컨트렉트에서 이를 접근 사용 가능.
        external : public 처럼 모든 곳에서 접근은 가능하나, external이 정의된 자기 자신 컨트렉트 내에서 접근 불가. 다른 컨트렉트에서만 접근 가능.
        private : 오직 private이 정의된 자기 컨트렉트에서만 가능. private이 정의된 컨트렉트를 상속 받은 자식도 불가능.
        internal : private 처럼 오직 internal이 정의된 자가 컨트렉트에서만 가능하고, internal이 정의된 컨트렉트를 상속
    */

    // 1. public
    uint256 public a = 5;

    // 2. private
    uint256 private a2 = 5;
}

contract Public_example_1 {
    uint256 public a = 3;

    function set_a (uint256 _value) public {
        a = _value;
    }

    function get_a () view public returns (uint256) {
        return a;
    }
}

contract Public_example_2 {
    Public_example_1 instance = new Public_example_1();

    function set_a_2 (uint256 _value) public {
        instance.set_a(_value);
    }

    function use_public_example_1_a () view public returns (uint256) {
        return instance.get_a();
    }
}


contract External_example_1 {
    uint256 public a = 3;

    function set_a (uint256 _value) external {
        a = _value;
    }

    function get_a () view public returns (uint256) {
        return a;
    }
}

contract External_example_2 {
    External_example_1 instance = new External_example_1();

    function set_a_2 (uint256 _value) public {
        instance.set_a(_value);
    }

    function use_external_example_1_a () view public returns (uint256) {
        return instance.get_a();
    }
}

