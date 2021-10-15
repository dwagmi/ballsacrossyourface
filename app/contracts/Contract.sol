// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Contract {
    uint256 totalWaves; //contract state variable, auto initalized to 0. 
    mapping (address => uint256) public numWaves; // initialized where  every possible Ethereum address exists in the mapping and is mapped to a corresponding level of 0

    constructor() {
        console.log("constructing contract");
    }

    function wave() public { // public keyword -> function will be available to be called on the blockchain
        totalWaves += 1; 
        numWaves[msg.sender] += 1; 
        console.log("%s has waved %d times!", msg.sender, numWaves[msg.sender]); // msg.sender is the wallet address of the person who called the function
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves); 
        return totalWaves; 
    }

}