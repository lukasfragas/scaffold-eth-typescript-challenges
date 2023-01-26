pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import 'hardhat/console.sol';
import './ExampleExternalContract.sol';

//address sender = msg.sender;
//uint timestamp = block.timestamp;
// abstract contract Staker {
contract Staker {
  ExampleExternalContract public exampleExternalContract;

  constructor(address exampleExternalContractAddress) public {
    exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
  }

  mapping(address => uint256) public balances;
  uint256 public constant threshold = 1 ether;

  event Stake(address indexed _staker, uint256 amount);

  // TODO: Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
  //  ( make sure to add a `Stake(address,uint256)` event and emit it for the frontend <List/> display )
  function stake() public payable {
    require(address(this).balance <= threshold, 'yOU CANT STAKE MORE!');
    balances[msg.sender] += msg.value;
    emit Stake(msg.sender, msg.value);
  }

  // TODO: After some `deadline` allow anyone to call an `execute()` function
  //  It should call `exampleExternalContract.complete{value: address(this).balance}()` to send all the value
  function execute() public


  // TODO: if the `threshold` was not met, allow everyone to call a `withdraw()` function

  // TODO: Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
  // function timeLeft() public view returns(uint256) {
  //   return
  // }

  // TODO: Add the `receive()` special function that receives eth and calls stake()
}

// error InsufficientBalance(uint256 available, uint256 required);

//   function stake(address to, uint256 amount) public payable {
//       if (amount > balances[msg.sender])
//           revert InsufficientBalance({
//               available: balances[msg.sender],
//               required: amount
//           });
//       balances[msg.sender] -= amount;
//       balances[to] += amount;
//   }
