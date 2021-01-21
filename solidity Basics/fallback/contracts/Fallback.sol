// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

// fallback is a func that does not take any arguments and does return anything.
// it is executed either when
// - a func that does not exist is called
// - Ether is sent directly to a contract but receive() does not exist or msg.data is not empty
// fallback has a 2300 gas limit when called by transfer or send.

contract Fallback {
    event Log(uint gas);

    // Fallback func must be declared as external.
    fallback() external payable {
        // send/transfer (forwards 2300 gas to this fallback func)
        // call (forwards all of the gas)
        emit Log(gasleft());
    }

    // helper func to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}