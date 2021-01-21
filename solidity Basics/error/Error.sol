// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// an error will undo all changes made to the state during a transaction.
/* 
  you can throw an error by calling require,revert or assert.
    - require is used to validate inputs and conditions before execution.
    - revert is similar to require. see the code below for details.
    - assert is used to check for code that should never be false. failing assertion probably means that there is a bug.
*/

contract Error {
    function testRequire(uint _i) public pure {
        /*
          require should be used to validate conditions such as:
            - inputs
            - conditions before execuion
            - return values from calls to other functons
        */
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // revert is useful when the condition to check is complex.
        // this code does the exact same thing as the example above
        if (_i < 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // assert should only be used to test for internal errors, and to check invariants.
        // here we assert that num is always equal to 0 since it is impossible to update the value of num.
        assert(num == 0);
    }
}