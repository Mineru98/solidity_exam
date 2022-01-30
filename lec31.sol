// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
    SPDX-License-Identifier 목적
    1. 라이센서를 명시해줌으로써 스마트 컨트랙트에 대한 신뢰감을 높일 수 있음.
    2. 스마트 컨트렉트 소스 코드가 워낙 오픈되어 있으니, 저작권과 같은 관련된 문제를 해결해줌.
*/

contract lec31 {
    /*
        주석
        1. 블록 단위 : 보통 블록단위의 주석은 스마트 컨트렉트, 함수 등 많은 양의 설명
        2. 행단위 : 행 단위는 변수 바로 옆에 쓰이는 간단한 설명
    */
    /*
        add 함수는 9를 리턴!
    */
    function add() pure public returns (uint256) {
        return 4 + 5; // 4 + 5 = 9 반환
    }
}