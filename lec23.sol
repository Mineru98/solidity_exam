// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec23 {
    // continue : 다음 반복문으로 이동
    // break : 반복문 끝냄

    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Koear", "North Korea", "USA", "Japan", "China"];

    function useContinue() public {
        for(uint256 i=0;i < countryList.length; i++) {
            if(i%2==1) {
                continue;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }

    function useBreak() public {
        for(uint256 i=0;i < countryList.length; i++) {
            if(i == 2) {
                break;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }
}