// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// a constructor is an optional func that is executed upon contranct creation.
// here are examples of how to pass arguments to constructor.

// base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// there are 2 ways to initialize parent contract with parameters.

// pass the parameters here in the inheritance lise.
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    // pass the parameters here in the constructor, similar to func modifiers.
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {

    }
}

/*
    parent constructors are always called in the order of inheritance
    regardless of the order of parent contracts listed in the constructor 
    of the child contract.
*/

// order of constructor called: 1.Y  2.X  3.E
contract E is X, Y {
    constructor() X("X was called.") Y("Y was called.") {
    }
}

// order of constructor called: 1.Y  2.X  3.F
contract F is X, Y {
    constructor() Y("Y was called.") X("X was called.") {
    }
}

// order of constructor called: 1.X  2.Y  3.G
contract G is Y, X {
    constructor() Y("Y was called.") X("X was called.") {
    }
}