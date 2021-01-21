// SPDX-License-Identifier: MIT

// call is a low level function to interact with other contracts.
// this is the recommended method to use when you're just sending Ether vai call the fallback function.
// however it is not the recommend way to call existing functions.

pragma solidity ^0.7.6;

contract Receiver {
    event Received(address caller, uint amount, string message);

    receive() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);

        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    /** 
     *   Let's imagine that contract B does not have the source code for
     * contract A, but we do know the address of A and the func to call.
     */
    function testCallFoo(address payable _addr) public payable {
        // you can send ether and specify a custom gas amount
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 50000}(
            abi.encodeWithSignature("foo(string, uint256)", "call foo", 123)
        );

        emit Response(success, data);
    }

    // calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}