// SPDX-License-Identifier : GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec2 {
    // Basic Data Type
    // boolean, bytes, address, uint

    // boolean : true / false
    bool public b = false;

    bool public b1 = !false; // true
    bool public b2 = false || true; // true
    bool public b3 = false == true; // false
    bool public b4 = false && true; // false

    // bytes 1 ~ 32 : 1~32 바이트까지만 저장 가능
    bytes4 public bt = 0x12345678; // 명시적으로 4바이트임을 알릴 수 있다.
    bytes public bt2 = "STRING";

    // address
    // 이더리움을 송수신 할 때 Address 기준으로 보내지고 받아진다.
    address public addr = 0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee;

    // int vs uint
    // int8
    // -2^7 ~ 2^7 - 1
    int8 public i_num = 4;
    // uint8
    // 0 ~ 2^8 - 1
    uint256 public ui_num = 132213;

    // DeclarationError : Identifier not found or not unique.
    // uint8 public uint2 = 256;

    // Reference Type
    // string, Arrays, struct

    // Mapping Type
}