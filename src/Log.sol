// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

/**
* @title Log (Logarithm)
* @author fps (@0xfps).
* @dev A simple solidity positive-only logarithm library.
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
        if (b < 2) revert("LOG: INVALID_BASE");

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

    function logDiv(uint256 x, uint256 y, uint256 b) internal pure returns (uint256) {
        return log(x, b) - log(y, b);
    }

    function logPow(uint256 x, uint256 p, uint256 b) internal pure returns (uint256) {
        return p * log(x, b);
    }

    function logRt(uint256 x, uint256 r, uint256 b) internal pure returns (uint256) {
        if (r == 0) revert("LOG: ZERO_DIVISION");
        return log(x, b) / r;
    }
}