// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Faucet {
    // Give out ether to anyone who asks
    function withdraw(uint256 withdrawAmount) public {
        // Limit withdrawal amount to 0.1 ether
        require(withdrawAmount <= 0.1 ether, "Withdrawal amount exceeds limit");
        
        // Ensure the contract has enough balance to fulfill the request
        require(address(this).balance >= withdrawAmount, "Insufficient balance in faucet for withdrawal request");

        // Send the amount to the address that requested it
        (bool success, ) = msg.sender.call{value: withdrawAmount}("");
        require(success, "Transfer failed.");
    }

    // Accept any incoming amount
    receive() external payable {}
}

