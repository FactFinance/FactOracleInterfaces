## Fact Oracle Interface V1.0002 Usage Guide
### Introduction
The FOInterfaceV1 contract provides an interface for interacting with a Fact Oracle (FO) system. This guide outlines how to use the interface to retrieve data feeds and manage subscriptions.


### Oracle Address - MAINET

**GNOSIS**
   - **CDI Daily**  0x8F84B53D98686346682e5f9cD9248B72F8a7383F
   - **CDI Monthly** 0x5DE7C939998f9eD3A66a7712a7b298816400E71D   - 
   - **CID Daily Growth Factor** 0x5935Bc8bbf4B8914990371ea9D3e132f276efd9d  - only getLast() and getDate() - Decimal 8 
   - **SELIC Daily** 0x94C3897e55D30644477c0b184258F440E3632835
   - **SELIC Daily Growth Factor** 0xF97D14e9e16e7A3596711f99d5e7668312248B86  - only getLast() and getDate() - Decimal 8 
   - **Dólar PTAX** - 0xd26190e365a052228441e7E3236BFb36128CA9E8 -  only getLast()

**XDC**
 - **CDI Daily**  0x00675ABf08e4A9Ed5F6d4BB42935af3236226Eb2
 - ** Testnet** 0x7c7410fead839614f30485c65a7247cf47299794 

**Testnet** - CHIADO - OPEN Oracle - No subscription required
   - CDI Daily:  0xf4574F65c6Ef0275774fF059e38a173801E040F8
   - CDI Monthly 0x14FAdeDAC6bfcDF9aFe907463e34610b65eE40b0
   - CDI Growth Factor 0xe834f7225922DE21fe658a897F8C9f2E9EeD3eCC- only getLast() and getDate() - Decimal 8
   - Selic Daily 0xC68A8FAf034A563c1f20Ce87462F5f863a29985f   
   - Dólar Ptax 0x195ABa350c0F57b6e653fd9C9598Add793628BB9 -  only getLast()
    


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
   - Gnosis: 0x8Bc98Ead868add16BFf0eA4719972f7F737CBEf0
   - Chiado: 0x185Ab8510930fAf5CC8b1413F997592deEA2FA2D   // for kick develpment, tesnet are open. You don´t need to subcribe to access get access.
    
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
