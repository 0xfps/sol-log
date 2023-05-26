// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
* @title Log (Logarithm)
* @author fps (@0xfps).
* @dev A simple solidity positive-only logarithm library.
* @notice For logarithms, refer to http://rb.gy/xvkke.
*/

library Log {
    /**
    * @dev  Returns the value of log(x)
    *                               b
    * @param x Number.
    * @param b Base.
    * @return uint256 Power.
    */
    function log(uint256 x, uint256 b) internal pure returns (uint256) {
        return _log(x, b);
    }

    /**
    * @dev  Returns the value of log(x)
    *                               10
    * @param x Number.
    * @return uint256 Power.
    */
    function logB10(uint256 x) internal pure returns (uint256) {
        return log(x, 10);
    }

    /**
    * @dev  Returns the value of log(x * y)
    *                               b
    * @param x Number.
    * @param y Number.
    * @param b Base.
    * @return uint256 Power.
    */
    function logMul(uint256 x, uint256 y, uint256 b) internal pure returns (uint256) {
        return log(x, b) + log(y, b);
    }

    /**
    * @dev  Returns the value of log(x / y)
    *                               b
    * @param x Number.
    * @param y Number.
    * @param b Base.
    * @return uint256 Power.
    */
    function logDiv(uint256 x, uint256 y, uint256 b) internal pure returns (uint256) {
        return log(x, b) - log(y, b);
    }

    /**
    * @dev  Returns the value of log(x^p)
    *                               b
    * @param x Number.
    * @param p Exponent.
    * @param b Base.
    * @return uint256 Power.
    */
    function logPow(uint256 x, uint256 p, uint256 b) internal pure returns (uint256) {
        return log(x, b) * p;
    }

    /**
    * @dev  Returns the value of log(r√x)
    *                               b
    * @param x Number.
    * @param r Root e.g (√, 3√, 4√ ... n√).
    * @param b Base.
    * @return uint256 Power.
    */
    function logRt(uint256 x, uint256 r, uint256 b) internal pure returns (uint256) {
        if (r == 0) revert("LOG: ZERO_DIVISION");
        return log(x, b) / r;
    }

    /**
    * @dev  Returns the value of log(x)
    *                               b
    * @param x Number.
    * @param b Base.
    * @return p Power.
    */
    function _log(uint256 x, uint256 b) private pure returns (uint256 p) {
        if (x == 0) revert("LOG: UNDEFINED");
        if (b < 2) revert("LOG: INVALID_BASE");

        while (x >= b) {
            x /= b;
            ++p;
        }
    }
}