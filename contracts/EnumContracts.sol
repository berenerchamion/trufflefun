// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity >=0.8.13;

contract EnumsContract {

    // Create an Enumeration
    enum names {Joe, Brandy, Rachna, Jessica}

    // get the value at specified index
    function getNames(uint8 arg) public pure returns (string memory){
        if(arg == uint8(names.Joe)) return "Joe";
        if(arg == uint8(names.Brandy)) return "Brandy";
        if(arg == uint8(names.Rachna)) return "Rachna";
        if(arg == uint8(names.Jessica)) return "Jessica";

        return "Unknown";
    }
}