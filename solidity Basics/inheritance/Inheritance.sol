// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// solidity supports multiple inheritance. contracts can inherit other contract by the is keyword.
// func that is going to be overridden by a child contract must be declared as virtual.
// func that is going to override a parent func must use the keyword override.
// order of inheritance is important
// you have to list the parent contracts in the order from "most base-like" to "most derived".

/* Graph of inheritance
        A
       / \
       B  C
      / \/ \
     F  D/E
*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// contract can inherit from multiple parent contracts.
/*
        when a function is called that is defined multiple times in different
    contracts, parent contracts are searched from right to left, and in 
    depth-first manner.
*/
contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() return "B".
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}