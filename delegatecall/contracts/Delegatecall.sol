// SPDX-License-Identifier: MIT

// delegatecall is a low level function similar to call.
/**
 *   when contract A executes delegatecall to contract B, B's code
 * is excuted with contract A's storage, msg.sender and msg.value.
 **/ 

pragma solidity ^0.7.6;

contract B {
    // NOTE: storage layout must be the same as contract A
    uint    public num;
    address public sender;
    uint    public value;

    function setVars(uint _num) public payable {
        num    = _num;
        sender = msg.sender;
        value  = msg.value;
    }
}

contract A {
    uint    public num;
    address public sender;
    uint    public value;

    event Response(bool success, bytes data);

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        emit Response(success, data);
    }
}