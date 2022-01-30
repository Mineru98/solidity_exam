// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec22 {
    // for
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Koear", "North Korea", "USA", "Japan", "China"];

    function forLoopEvents() public {
        for (uint256 i = 0; i < countryList.length; i++) {
            emit CountryIndexName(i, countryList[i]);
        }
    }

    // while
    function whileLoopEvents() public {
        uint256 i = 0;
        while(i < countryList.length) {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
    }
    // do-while
    function doWhileLoopEvents() public {
        uint256 i = 0;
        do {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
        while(i < countryList.length);
    }
}