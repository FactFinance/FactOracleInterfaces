## Fact Oracle Interface V1.0001 Usage Guide
### Introduction
The FOInterfaceV1 contract provides an interface for interacting with a Fact Oracle (FO) system. This guide outlines how to use the interface to retrieve data feeds and manage subscriptions.


### Oracle Address - MAINET

**GNOSIS**
   - **CDI Daily**  0x8F84B53D98686346682e5f9cD9248B72F8a7383F
   - **SELIC Daily** 0x94C3897e55D30644477c0b184258F440E3632835

**Testnet** - CDI Daily**
   - Chiado:  0x8F84B53D98686346682e5f9cD9248B72F8a7383F
    

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

**DataFeed Struct** 

```solidity
/// @title Data Feed Struct
/// @notice This struct represents the data feed with a value and confidence level
/// @dev Used to store oracle data with an associated confidence score
struct DataFeed {    
    int256 value;        /// @dev Integer value of the data feed
    uint256 updatedat;   /// @dev Timestamp of backend data update
    uint8 decimal;       /// @dev Number of decimal places for the data value
    uint8 confidence;    /// @dev Confidence level of the data feed
                         /// @dev 1: outlier, 2: acceptable, 3: reliable
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
    cdiDataFeed = fOracle.getLast(); 
    // Process data feed values here
}
```

2. getDate(uint256 _timestamp): Get data feed values for a specific timestamp.

```solidity

function getDate(uint256 _timestamp) public {
    cdiDataFeed = fOracle.getDate(_timestamp);
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

### Manager Address getLicenseInfo()

Each DataNode can provide the address of its License Manager.

```solidity
getLicenseInfo()
   "0": "string: ECONOMIC_INDEX_BR",
   "1": "address: 0xED424A23d3f97c834F5895141Fd8E9EE64b15ea4"
```


# Fact Oracle Manager Interface V1

**Testnet - Economics License Manager**
   - Chiado:  0xED424A23d3f97c834F5895141Fd8E9EE64b15ea4
    
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


### License
This project is licensed under the MIT License. See the LICENSE file for details.
