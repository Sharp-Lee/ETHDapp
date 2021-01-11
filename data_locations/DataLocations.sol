// SPDX-License-Identifier: MIT

/*
 storage:
  - variable is a state variable (store on blockchain)
  - 一个字(插槽),占用256位,32字节
  - 开辟一个storage插槽空间消耗20000GAS
  - 修改一个storage插槽内的值消耗5000GAS
  - 清理storage插槽(即将插槽非0字节设置为0),会返还一定的GAS
  - 即使数据未占满一个插槽,依然按一个插槽计算GAS

 memory:
  - variable is in memory and it exists while a function is being called
  - memory是一个字节数组,其插槽大小为256位(32字节),数据仅在函数执行期间存储.
  - 读或写一个字(插槽,256位)需要3GAS
  - 22读写操作后,读写成本上升

 calldata:
  - special data location that contains function arguments, only available for external functions
  - calldata是不可修改,非持久化存储位置,用于存储函数参数,并且其行为基本类似于memory
  - 外部函数的参数必须使用calldata
  - calldata避免了数据拷贝，并确保数据不被修改
  - 带有 calldata 数据位置的数组和结构体也可以从函数中返回，但是不可以为这种类型赋值。
*/

/*
 引用传递: storage = sotrage  memory = memory
 值传递:   其他
*/

pragma solidity ^0.7.6;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStructs = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr, 
        mapping(uint => address) storage _map, 
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // you can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}