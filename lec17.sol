// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec17 {
    // key type => value type
    mapping(uint256=>uint256) private ageList;
    mapping(string=>uint256) private priceList;
    mapping(uint256=>string) private nameList;

    function getAge(uint256 _index) public view returns (uint256) {
        return ageList[_index];
    }

    function setAgeList(uint256 _index, uint256 _age) public {
        ageList[_index] = _age;
    }

    function getPrice(string memory _index) public view returns (uint256) {
        return priceList[_index];
    }

    function setPriceList(string memory _index, uint256 _price) public {
        priceList[_index] = _price;
    }

    function getName(uint256 _index) public view returns (string memory) {
        return nameList[_index];
    }

    function setNameList(uint256 _itemName, string memory _name) public {
        nameList[_itemName] = _name;
    }
}