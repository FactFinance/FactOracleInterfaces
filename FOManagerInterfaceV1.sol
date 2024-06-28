// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

/// @title Fact Oracle Manager Interface V1
/// @notice This interface defines the external functions for managing subscriptions and balances
/// @dev Implemented by contracts that manage oracle subscriptions and balances

interface FOManagerInterfaceV1 {
    /// @notice Grants a subscription to a specific address
    /// @param _address The address to be granted the subscription
    function grantSubcription(address _address) external;

    /// @notice Checks if an address is a subscriber
    /// @param _address The address to be checked
    /// @return True if the address is a subscriber, false otherwise
    function checkSubscriber(address _address) external view returns (bool);

    /// @notice Revokes a subscription from a specific address
    /// @param _address The address to have the subscription revoked
    function revokeSubscription(address _address) external;

    /// @notice Checks the balance of a specific customer
    /// @param _address The address of the customer
    /// @return The balance of the customer
    function checkBalance(address _address) external view returns (uint32);   
}
