// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity >=0.8.7;

contract MainContract {

    uint internal value;

    constructor (uint amount) {
        value = amount;
    }

    function deposit (uint amount) public {
        value += amount;
    }

    function withdraw (uint amount) public {
        value -= amount;
    }
}