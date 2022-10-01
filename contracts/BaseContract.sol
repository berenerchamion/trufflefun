// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity >=0.8.7;

import "./MainContract.sol";

// We have an ContractInterface, that has a function
// sendmoney...but there is no function body
interface ContractInterface {
    function sendMoney (uint amount, address _address) external returns (bool);
}

// This is a BaseContract, that has its constructor, and deposit and withdraw functions...
contract BaseContract {

    uint public value;

    // Anytime base contract has a constructor, we will need to initialize this using
    // the derived contracts constructor function

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

// This shows multiple inheritance

// This will give an error...since baseContract has a constructor that we need to initialize
// contract myContract is baseContract, interfaceContract {

contract InheritanceContract is BaseContract(100), ContractInterface {

    string public contractName;

    constructor (string memory _n) {
        contractName = _n;
    }
    function getValue () public view returns (uint) {
        return value;
    }

    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        address payable addr = payable(address((uint160(x))));
        return addr;
    }

    // This function has to be implemented, since it is unimplemented in the interfaceContract
    function sendMoney (uint amount, address _address) public override returns (bool) {
        //return false;
        _make_payable(_address).transfer(amount);
    }
}