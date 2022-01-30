// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec16_Father {
    event fatherName(string name);

    function who() public virtaul {
        emit fatherName("KimDaeho");
    }
}

contract lec16_Mother {
    event motherName(string name);

    function who() public virtaul {
        emit motherName("leeSol");
    }
}

// 왼쪽부터 오른쪽 순으로 최신 상속순
contract lec16_Son is lec16_Father, lec16_Mother {
    function who() public override(lec16_Father, lec16_Mother) {
        super.who();
    }
}