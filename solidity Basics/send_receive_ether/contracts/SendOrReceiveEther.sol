// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// call in combination with re-entrancy guard is the recommended method to use after Dec 2019.
// guard against re-entrancy by
// - making all state changes before calling other contracts
// - using re-entrancy guard modifier

contract ReceiveEther {
    /**
     * which func is called, fallback() or receive()
     *
     *                 send Ether
     *                     |
     *               msg.data is empty?
     *                    / \
     *                  yes  no
     *                  /     \
     *    receive() exists?  fallback()
     *                /  \
     *              yes  no
     *              /      \
     *        receive()   fallback()
     */
    
    // func to receive Ether. msg.data must be empty
    receive() external payable {}

    // fallback func is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // this func is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // send returns a boolean value indicating success or failure.
        // this func is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // call returns a boolean value indicating success or failure.
        // this is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value:msg.value}("");
        require(sent, "Failed to send Ether.");
    }
}