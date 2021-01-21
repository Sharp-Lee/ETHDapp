// SPDX-License-Identifier: MIT

// GasFee = GasSpent * GasPrice
// Gas limit: max amount of gas you willing to use for your transaction, set by you
// Block gas limit: max amount of gas allowed in a block, set by the network

pragma solidity ^0.7.6;

contract Gas {
    uint public i = 0;

    // using up all of the gas that you send causes your transaction to fail.
    // state change are undone.
    // gas spent are not refunded.
    function forever() public {
        // here we run a loop until all of the gas are spent
        // and the transaction fails
        while(true) {
            i += 1;
        }
    }
}