// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

/*
    events allow logging to the etherenum blockchain. some use cases for events are:
        - listening for events and updating user interface
        - a cheap form of storage
*/

contract Event {
    // event declaration
    // up to 3 parameters can be indexed.
    // indexed parameters helps you filter the logs by the indexed parameter.
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "hello world!");
        emit Log(msg.sender, "hello EVM!");
        emit AnotherLog();
    }
}