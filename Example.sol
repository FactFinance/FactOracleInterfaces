// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./FOInterfaceV1.sol";
import "./FOManagerIterfaceV1.sol";

/// @title Consumer Fact Oracle Contract
/// @notice This contract allows interaction with a Fact Oracle, providing methods to retrieve and manage oracle data
/// @dev Implements functions to fetch the latest data, data by timestamp, and accumulated values, with owner-only access control

contract ConsumerFOracle {

    /*  Oracle Setup */

    
    FOInterfaceV1 public fOracle;   /// @notice Instance of the FOInterfaceV1 to interact with the oracle
    
    constructor(address _oracle) { /// @notice Constructor to initialize the ConsumerFOracle contract
        owner = msg.sender;
        updateOracle(_oracle);
    }
     
    function updateOracle(address _oracle) public onlyOwner {   /// @notice Updates the oracle address
        fOracle = FOInterfaceV1(_oracle);
    }

    /*  Oracle Usage */

    /// @notice Retrieves the latest data feed from the oracle and updates contract state variables
    function getLast() public {
        cdiDataFeed = fOracle.getLast();       
        decimal = fOracle.decimal();
    }


    /// @notice Retrieves the accumulated value of data feeds over a specified interval from the oracle
    /// @param _start The start timestamp of the interval
    /// @param _end The end timestamp of the interval
    function getInterval(uint256 _start, uint256 _end) public {
        accrued = fOracle.getInterval(_start, _end);
    }

    
    /// @notice Retrieves the data feed for a specific timestamp from the oracle and updates contract state variables
    /// @param _timestamp The timestamp of the data feed to retrieve
    function getDate(uint256 _timestamp) public {
        cdiDataFeed = fOracle.getDate(_timestamp);       
    }



    /*  basic contract example  */
    address public owner;    
    DataFeed public cdiDataFeed;
    int256 public accrued;    
    uint8 public decimal;

    /// @notice Resets the contract state variables
    function reset() public {
        cdiDataFeed = DataFeed(0,0,0);
    }

    /// @dev Modifier to check if the caller is the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }
}
