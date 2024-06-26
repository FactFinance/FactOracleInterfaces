## Fact Oracle Interface V1 Usage Guide
### Introduction
The FOInterfaceV1 contract provides an interface for interacting with a Fact Oracle (FO) system. This guide outlines how to use the interface to retrieve data feeds and manage subscriptions.


### Oracle Address 

**Testnet - CDI Daily**
   - Chiado:  0xf17f824cda3A5eED56bD0EF454e5E1b078Eb85CA
    

### Getting Started
Prerequisites
  - .sol interface file or a clone of this repo https://github.com/FactFinance/FactOracleInterfaces.git
  - Access to a development environment with Solidity compiler and a blockchain network like Remix at https://remix.ethereum.org/

### Installation

Import the Interface: Ensure you have imported FOInterfaceV1.sol into your Solidity project.

```solidity
import "./FOInterfaceV1.sol";
```

Contract Initialization: Obtain the address of a contract that implements FOInterfaceV1 at https://fact.finance.

### Usage

Below is an example contract ConsumerFOracle demonstrating how to interact with FOInterfaceV1:

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./FOInterfaceV1.sol";

contract ConsumerFOracle {
    FOInterfaceV1 fOracle;

    constructor(address _oracle) {
        fOracle = FOInterfaceV1(_oracle);
    }

    function getLast() public {
        (uint256 feedTimestamp, DataFeed memory dataFeed) = fOracle.getLast();
        // Process data feed values
    }

    function getDate(uint256 _timestamp) public {
        DataFeed memory dataFeed = fOracle.getDate(_timestamp);
        // Process data feed values for a specific timestamp
    }

    function getInterval(uint256 _start, uint256 _end) public {
        int256 accrued = fOracle.getInterval(_start, _end);
        // Process accumulated value for a time range
    }

    // Additional contract functions as needed
}
```

### Interacting with FOInterfaceV1

Initialization
Constructor: Initialize ConsumerFOracle with the address of your deployed FOInterfaceV1 contract.

```solidity

constructor(address _oracle) {
    fOracle = FOInterfaceV1(_oracle);
}
```

Methods

1. getLast(): Retrieve the latest data feed stored in the FO system.

```solidity

function getLast() public {
    (uint256 feedTimestamp, DataFeed memory dataFeed) = fOracle.getLast();
    // Process data feed values here
}
```

2. getDate(uint256 _timestamp): Get data feed values for a specific timestamp.

```solidity

function getDate(uint256 _timestamp) public {
    DataFeed memory dataFeed = fOracle.getDate(_timestamp);
    // Process data feed values for the specified timestamp
}
```

3. getInterval(uint256 _start, uint256 _end): Calculate accumulated value between two timestamps.

```solidity

function getInterval(uint256 _start, uint256 _end) public {
    int256 accrued = fOracle.getInterval(_start, _end);
    // Process accumulated value for the specified time range
}
```

# Fact Oracle Manager Interface V1

## Introduction
The Fact Oracle Manager Interface V1 defines external functions for managing subscriptions and balances within the Fact Finance ecosystem. This interface allows contracts to grant and revoke access to data from the Fact Oracle and manage customer balances effectively.

### Interface Description
The FOManagerInterfaceV1 interface is implemented by contracts that manage subscriptions and balances for accessing data from the Fact Oracle.

### Functions
**grantSubscription**

```solidity

/// @notice Grants a subscription to a specific address
/// @dev Implemented to allow contracts to grant access to the Fact Oracle
/// @param _address The address to be granted the subscription
function grantSubscription(address _address) external;
```

This function grants a subscription to a specified address, enabling access to data provided by the Fact Oracle.

**checkSubscriber**

```solidity

/// @notice Checks if an address is a subscriber
/// @dev Implemented to verify if an address has an active subscription
/// @param _address The address to be checked
/// @return True if the address is a subscriber, false otherwise
function checkSubscriber(address _address) external view returns (bool);
```

This function verifies whether a given address is currently subscribed to access data from the Fact Oracle.

**revokeSubscription**

```solidity

/// @notice Revokes a subscription from a specific address
/// @dev Implemented to revoke access to the Fact Oracle for a subscriber
/// @param _address The address to have the subscription revoked
function revokeSubscription(address _address) external;
```

This function revokes an existing subscription for a specified address, terminating their access to data from the Fact Oracle.

**checkBalance**

```solidity

/// @notice Checks the balance of a specific customer
/// @dev Implemented to retrieve the balance associated with a customer's address
/// @param _address The address of the customer
/// @return The balance of the customer
function checkBalance(address _address) external view returns (uint32);
```

This function retrieves the balance of a specific customer, which indicates their remaining credits or entitlements within the Fact Oracle subscription system.

## Usage

### Integration Example

Implement the FOManagerInterfaceV1 interface in your contract to manage subscriptions and balances for accessing data from the Fact Oracle.

```solidity

import "./FOManagerInterfaceV1.sol";

contract FactOracleManager {
    FOManagerInterfaceV1 foManager;

    constructor(address _foManager) {
        foManager = FOManagerInterfaceV1(_foManager);
    }

    function grantAccess(address _subscriber) public {
        foManager.grantSubscription(_subscriber);
    }

    function revokeAccess(address _subscriber) public {
        foManager.revokeSubscription(_subscriber);
    }

    function checkAccess(address _subscriber) public view returns (bool) {
        return foManager.checkSubscriber(_subscriber);
    }

    function checkSubscriberBalance(address _subscriber) public view returns (uint32) {
        return foManager.checkBalance(_subscriber);
    }
}
```

### License
This project is licensed under the MIT License. See the LICENSE file for details.
