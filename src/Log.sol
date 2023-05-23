// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

/**
* @title Logarithm
* @author fps (@0xfps).
* @dev A simple solidity logarithm library.
*/

library Log {
    /// @dev    Returns the value of log(b)
    ///                                 a
    function log(uint256 a, uint256 b) internal pure returns (uint256 p) {
        while (b > a) {
            b /= a;
            ++p;
        }
    }
}