// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "node_modules/@openzeppelin/token/ERC20/ERC20.sol";
pragma solidity ^0.8.0;
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract SansuCoin is ERC20  {
    // address owner;
 constructor () ERC20("SansuCoin","SANS") {
    // owner = msg.se;
    // _mint(msg.sender,_initialVal)
    //mint toekns
 }
 function mintTo( address to  ,uint amount) public {
    // require(msg.sender == owner);
    _mint(to,amount);

 }
}
