// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract TestCounter is Test {
    Counter c;

    function setUp() public {
        c = new Counter(100 );
    }

//    function testInc() public {
//       c.increment();
//       c.increment();
//       assertEq(c.getNum(), 102,"ok");        

//    }
//    function testDec() public {
//     c.decrement();
//     c.decrement();
//     c.decrement();
//     assertEq(c.getNum(), 97,"dec test is ok ");
//    }

//    function testFailDec() public {
//     c.decrement();
//     c.decrement();
//     c.decrement();
//     c.decrement();
//     assertEq(c.getNum(),103,"ok");
//    }
 
}
//in foundry we write contracts locallly;
//also we can do testing , foundry uses solidity lang for testing while harhat uses javascript/typescript thats hardahat feels easy but founsry is more fast andmore contact centric 
