// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

// func and state variables have to declare whether they are accessible by other contracts.
/**
 * functions can be declared as:
 * - public: any contract and account can call
 * - private: only inside the contract that defines the func
 * - internal: only inside contract that inherits an internal function, 与private相似, 不同在于子类合约也可以访问父类合约的internal函数.
 * - external: only other contracts and accounts can call, 与public相似, 不同在于不能被合约内的其他函数调用.
 */
// State variables can be declared as public, private, or internal but not external.

contract Base {
    // private function can only be called inside this contract
    // contracts that inherit this contract cannot call this func.
    function privateFunc() private pure returns (string memory) {
        return "private func called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // internal func can be called 
    // - inside this contract
    // - inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // external functions can only be called
    // - by other contract and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // This function will not compile since we're trying to call
    // an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won't compile.
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal function call be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}