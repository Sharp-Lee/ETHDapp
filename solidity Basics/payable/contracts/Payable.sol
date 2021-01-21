// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// functions and addresses declared payable can receive ether into the contract.

contract Payable {
    // payable address can receive Ether
    address payable public owner;

    // payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // func to deposit Ether into this contract.
    // call this func along with some Ether.
    // the balance of this contract will be automatically updated.
    function deposit() public payable {
        
    }

    // call this func along with some Ether.
    // the func will throw an error since this func is not payable.
    function notPayable() public {
        
    }

    // func to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;

        // send all Ether to owner
        // owner can receive Ether since the address of owner is payable
        (bool success,) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that "to" is declared as payable
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}