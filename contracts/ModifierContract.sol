// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity >=0.8.13;

contract ModifierContract {
    int public minimumBid = 100;
    int bidAmount = 0;
    int bidPlaced = 0;

    function setBid(int bid) public returns (bool) {
        if (bid < 100) {
            revert("You\'re bid is below the minimum of 100.");
        }
        else {
            bidAmount = bid;
            bool success = placeBid(bid);
            if (success == false) {
                revert("You\re bid was not placed.");
            }
            else {
                return true;
            }
        }

    }

    function placeBid(int bid) public returns (bool) {
        bidAmount = bid;
        return true;
    }

}