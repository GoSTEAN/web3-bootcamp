// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title HelloWorld Contract
/// @notice This contract provides basic state variables including a greeting message, numbers, and a private address.
/// @dev Demonstrates the use of public and private visibility in state variables.
contract HelloWorld {
    /// @notice A greeting message
    /// @dev The greet variable stores a string that is visible to everyone.
    string public greet = "Hello World";

    /// @notice A constant number value
    /// @dev This is an 8-bit unsigned integer and can hold values from 0 to 255.
    uint8 public num = 255;

    /// @notice Another constant number value
    /// @dev This is a 16-bit unsigned integer, larger than num.
    uint16 public num16 = 800;

    /// @notice An example Ethereum address
    /// @dev This address is private and cannot be accessed outside of the contract.
    address private addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    /// @notice A boolean flag indicating registration status
    /// @dev This variable can be true or false and is publicly visible.
    bool public isRegister;
}
