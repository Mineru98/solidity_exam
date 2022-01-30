// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec3 {
    /*
        1 ether = 10^18 wei = 10^9 Gwei
        1 wei = 1^-18 ether = 0.00000000000000001 ether
        0.01 ether = 10^16 wei

        스마트 컨트렉트의 계약(코드)에 따라서 가스에 대한 비용이 달라진다.
    */

     uint256 public value = 1 ether;
     uint256 public value2 = 1 wei;
     uint256 public value3 = 1 gwei;

    /*
        스마트 컨트렉트를 배포를 하거나 무언가를 확인을 할때  gas가 소비 된다.

        이는 보안적인 면에서도 이점을 가져간다.
        DDos 공격 방어도 가능하다. 강제로 스마트 컨트렉트를 이행하면 이행하는 본인의 gas 소모가 되기 때문이다.

        따라서 스마트 컨트렉트를 배포 할 때 개발자는 gas 비용을 최소화 할 수 있는 방안을 고려해야 한다.
    */
}