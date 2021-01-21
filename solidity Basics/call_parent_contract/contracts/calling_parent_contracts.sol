// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

/* Inheritance tree
        A
       / \
      B   C
       \ /
        D
 */

contract A {
    /** 
     *     this is called an event. you can emit events from your func
     *  and they are logged into the transaction log. in our case, this
     *  will be useful for tracing func calls.
     */
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    /**
     * Try:
     * - call D.foo and check the transaction logs.
     *   although D inherits A, B and C, it only called C and then A.
     * - call D.bar and check the transaction logs.
     *   D called C, then B, and finally A.
     *   although super was called twice(by B and C) it only called A once.
     */
    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}