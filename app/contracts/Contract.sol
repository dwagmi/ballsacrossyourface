// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Contract {
    uint256 totalWaves; //contract state variable, auto initalized to 0. 

    constructor() {
        console.log("constructing contract");
    }

    function wave() public {
        totalWaves += 1; 
        console.log("%s has waved!", msg.sender); // msg.sender is the wallet address of the person who called the function
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves); 
        return totalWaves; 
    }
}