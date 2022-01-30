// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec8_A {
    uint256 public a = 5;

    function set_a(uint256 _value) public {
        a = _value;
    }
}

contract lec8_B {
    /*
        만약 lec8_A의 컨트렉트로 직접 사용하여 a 값을 수정하더라도 lec8_B 컨트렉트의 instance에는 영향을 주지 않는다.
        왜냐하면 클래스를 생성하는 것처럼 설계도를 복사해서 가져와 무언가를 만들었을 뿐인거지 설계도 자체를 수정을 하지 않았기 때문이다.
        그리고 복사한 설계도를 수정한다고 해서 원본 설계도가 수정 되는 것이 아니기 때문에 수정(객체로 가져온 데이터를 변경)을 해도 무관함.
    */
    lec8_A instance = new lec8_A();

    // view 키워드를 사용한 이유는 외부의 변수를 가져오지만, 그것을 변경하지 않기 때문에 사용함.
    function get_a(uint256 _value) public view returns (uint256) {
        return instance.a();
    }

    function set_a(uint256 _value) public {
        instance.set_a(_value);
    }
}
