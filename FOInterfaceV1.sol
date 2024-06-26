// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

/// @title Fact Oracle Interface V1
/// @notice This interface defines the external view functions for accessing data feeds
/// @dev Implemented by contracts that provide oracle data feeds
interface FOInterfaceV1 {
    /// @notice Retrieves the latest data feed    
    /// @return dataFeed The latest data feed
    function getLast() external view returns (DataFeed memory dataFeed);

    /// @notice Retrieves the data feed for a specific timestamp
    /// @param _timestamp The timestamp of the data feed to retrieve
    /// @return dataFeed The data feed for the specified timestamp
    function getDate(uint256 _timestamp) external view returns (DataFeed memory dataFeed);

    /// @notice Retrieves the accumulated value of data feeds over a specified interval
    /// @param _start The start timestamp of the interval
    /// @param _end The end timestamp of the interval
    /// @return The accumulated value of data feeds over the specified interval
    function getInterval(uint256 _start, uint256 _end) external view returns (int256);

    /// @notice Retrieves the number of decimals for the data values
    /// @return The number of decimals for the data values
    function decimal() external view returns (uint8); 
}


/// @title Data Feed Struct
/// @notice This struct represents the data feed with a value and confidence level
/// @dev Used to store oracle data with an associated confidence score
struct DataFeed {    
    int256 value;        /// @dev Integer value of the data feed
    uint256 updatedat;   /// @dev timestamp of backend data update
    uint8 confidence;    /// @dev Confidence level of the data feed
                         /// @dev 1: outlier, 2: acceptable, 3: reliable
}
