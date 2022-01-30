// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec7 {
    /*
        Solidity의 저장 방식
        storage : 대부분의 변수, 함수들이 저장되며, 영속적으로 저장이되어 가스 비용이 비싸다.
        memory : 함수의 파라미터, 반환값, 레퍼런스 타입이 주로 저장 됨.
                 그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기 때문에 storage보다 가스 비용이 쌈.@return
        colldata : 주로 external function의 파라미터에서 사용 됨.
        stack : EVM(Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024MB로 제한 됨.
    */

    // function - string
    function get_string(string memory _str) public pure returns (string memory) {
        return _str;
    }

    // uint의 경우는 기본적으로 memory라고 지정 되어 있기 때문에 명시하지 않아도 됨.
    function get_uint(uint256 _ui) public pure returns (uint256) {
        return _ui;
    }
}