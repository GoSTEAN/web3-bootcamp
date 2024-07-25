// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title CarCompany Contract
/// @notice This contract manages the sale of cars for a car company named "Goshen".
/// @dev Tracks the total cars available, cars sold, and details of the last car purchased.
contract CarCompany {
    /// @notice The total number of cars initially available for sale
    /// @dev This is a private state variable that stores the total count of cars.
    uint16 private totalCars = 4;

    /// @notice The number of cars currently available for sale
    /// @dev Updated each time a car is bought.
    uint16 internal carLeft = totalCars;

    /// @notice The name of the car company
    /// @dev This is a public state variable, accessible by anyone.
    string public companyName = "Goshen";

    /// @notice The name of the last car purchased
    /// @dev This internal state variable is updated with each car purchase.
    string internal yourCarName;

    /// @notice The number of cars sold
    /// @dev This internal state variable tracks the number of cars sold by the company.
    uint16 internal numCarSold = 0;

    /// @notice Retrieves the name of the car company
    /// @return The name of the company as a string
    function getCompanyName() public view returns (string memory) {
        return companyName;
    }

    /// @notice Retrieves the name of the last car purchased
    /// @dev This function is external and can be called by other contracts.
    /// @return The name of the last car purchased as a string
    function getYourCarName() external view returns (string memory) {
        return yourCarName;
    }

    /// @notice Retrieves the total number of cars available (internal use)
    /// @dev This internal function returns the initial total number of cars.
    /// @return The total number of cars as an unsigned 16-bit integer
    function getTotalCars() internal view returns (uint16) {
        return totalCars;
    }

    /// @notice Retrieves the number of cars sold
    /// @return The number of cars sold as an unsigned 16-bit integer
    function getNumCarSold() private view returns (uint16) {
        return numCarSold;
    }

    /// @notice Retrieves the number of cars left
    /// @return The number of cars left as an unsigned 16-bit integer
    function getCarLeft() public view returns (uint16) {
        return carLeft;
    }

    /// @notice Allows a customer to buy a car
    /// @dev Updates the number of cars left, number of cars sold, and the name of the last car purchased.
    /// @param _yourCarName The name of the car purchased by the customer
    function buyCar(string memory _yourCarName) public {
        require(carLeft > 0, "No more cars available for sale");

        // Update the last purchased car's name
        yourCarName = _yourCarName;

        // Update state variables
        carLeft--;
        numCarSold++;
    }

    /// @notice Calculates the number of cars left based on total cars and cars sold
    /// @dev A pure function that performs a simple arithmetic operation.
    /// @param _totalCars The total number of cars initially available
    /// @param _numCarSold The number of cars sold so far
    /// @return The number of cars left as an unsigned 16-bit integer
    function calculateCarsLeft(uint16 _totalCars, uint16 _numCarSold) private pure returns (uint16) {
        require(_totalCars >= _numCarSold, "Number of cars sold cannot exceed total cars");
        return _totalCars - _numCarSold;
    }
}
