// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

/**
* @title Log (Logarithm)
* @author fps (@0xfps).
* @dev A simple solidity logarithm library.
* @notice For logarithms, refer to http://rb.gy/xvkke.
*/

library Log {
    /**
    * @dev    Returns the value of log(x)
    *                                 b
    * @param x Number.
    * @param b Base.
    * @return p Power.
    */
    function log(uint256 x, uint256 b) internal pure returns (uint256 p) {
        while (x > b) {
            x /= b;
            ++p;
        }
    }
}