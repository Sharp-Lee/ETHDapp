// SPDX-License-Identifier: MIT

// maps are created with the syntax mapping(keyType => valueType).
// keyType can be value types such as uint, address or bytes.
// valueType can be any type including another mapping or an array.
// mapping are not iterable.

pragma solidity ^0.7.6;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;
    
    function get( address _addr ) public view returns (uint) {
        // mapping always returns a value
        // if the value was never set, it will return the default value
        return myMap[_addr];
    }

    function set( address _addr, uint _i ) public {
        // update the value at this address
        myMap[_addr] = _i;
    }

    function remove( address _addr ) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // nested mapping (mapping from address to another mapping)
    mapping( address => mapping( uint => bool )) public nested;

    function get ( address _addr1, uint _i ) public view returns ( bool ) {
        // you can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}