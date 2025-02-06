pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/MyToken.sol";

contract TestMyToken is Test {
    event Transfer(address indexed from , address indexed to , uint256 value);
    event Approval(address indexed owner , address indexed spender , uint256 value);

    SansuCoin c;
    
    function setUp() public {
        c = new SansuCoin();
    }

    // function test() public {
    //     assertEq(uint(2),uint(2),"token test is running");

    function testMint ()  public {
        c.mintTo(address(this),100);
        assertEq(c.balanceOf(address(this)) , 100 , "ok");
    }
   function testTransfer() public {
    c.mintTo(address(this),100);
    c.transfer(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370,50);
    assertEq(c.balanceOf(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370),50);
    assertEq(c.balanceOf(address(this)),50);

    vm.prank(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370);
    c.transfer(address(this),50);

    assertEq(c.balanceOf(address(this)),100);
    assertEq(c.balanceOf(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370),0);
   }

   function testApproval() public {
    c.mintTo(address(this),200);
    c.approve(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370,100);
    // assertEq(c.balanceOf(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370),100);
    vm.prank(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370);
    c.transferFrom(address(this),0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370,70);

    assertEq(c.balanceOf(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370),70);

   } 

    function testTransferEmit () public {
        c.mintTo(address(this),100);
        vm.expectEmit(true,true,false,true);
        emit Transfer(address(this), 0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370, 50);
        c.transfer(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370,50);
    }
     
     function testApprovalEmit() public {
        c.mintTo(address(this),100);
        vm.expectEmit(true,true,false,true);
        emit Approval(address(this) , 0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370 , 50);

        c.approve(0xa2b47cA5ABC0cb7008eF59e427E126bb8392b370,50);
     }
    
}