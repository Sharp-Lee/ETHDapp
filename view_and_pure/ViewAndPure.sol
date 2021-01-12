// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// getter func can be declared view or pure
// view func declares that no state will be change
// pure func declares that no state variable will be changed or read.

contract ViewAndPure {
    uint public x = 1;

    // promise not to modify the state
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}