// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title A simple counter contract
/// @notice This contract allows incrementing, decrementing, and setting a counter value.
/// @dev This is a basic example of a counter with increment and decrement functionality.
contract Counter {
    /// @notice The current count value
    uint8 private count = 0;

    /// @notice Returns the current count value
    /// @dev The function is marked as view, meaning it does not modify the state.
    /// @return The current count as an unsigned 8-bit integer
    function getCount() public view returns (uint8) {
        return count;
    }

    /// @notice Increments the count by 1
    /// @dev This function increases the count state variable by 1.
    function increment() public {
        count++;
    }

    /// @notice Decrements the count by 1
    /// @dev This function decreases the count state variable by 1.
    function decrement() public {
        require(count > 0, "You can't decrease again!");
        count--;
    }

    /// @notice Sets the count to a specific value
    /// @param _count The new value for the count
    /// @dev The input parameter _count allows setting the count directly.
    function setCount(uint8 _count) public {
        count = _count;
    }
}
