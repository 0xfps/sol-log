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
    function _log(uint256 x, uint256 b) private pure returns (uint256 p) {
        if (b <= 1) revert("LOG: INVALID_BASE");
        
        while (x >= b) {
            x /= b;
            ++p;
        }
    }

    function log(uint256 x, uint256 b) internal pure returns (uint256) {
        return _log(x, b);
    }

    function logB10(uint256 x) internal pure returns (uint256) {
        return log(x, 10);
    }

    function logMul(uint256 x, uint256 y, uint256 b) internal pure returns (uint256) {
        return log(x, b) + log(y, b);
    }
}