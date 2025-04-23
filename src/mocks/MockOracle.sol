// src/mocks/MockOracle.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract BNBMockOracle is AggregatorV3Interface {
    int256 public price;

    constructor(int256 _price) {
        price = _price;
    }

    function latestRoundData()
        external
        view
        override
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, price, block.timestamp, block.timestamp, 0);
    }

    function setPrice(int256 _price) external {
        price = _price;
    }
}

contract BTCBMockOracle is AggregatorV3Interface {
    int256 public price;

    constructor(int256 _price) {
        price = _price;
    }

    function latestRoundData()
        external
        view
        override
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, price, block.timestamp, block.timestamp, 0);
    }

    function setPrice(int256 _price) external {
        price = _price;
    }
}

contract USDCMockOracle is AggregatorV3Interface {
    int256 public price;

    constructor(int256 _price) {
        price = _price;
    }

    function latestRoundData()
        external
        view
        override
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, price, block.timestamp, block.timestamp, 0);
    }

    function setPrice(int256 _price) external {
        price = _price;
    }
}

contract USDTMockOracle is AggregatorV3Interface {
    int256 public price;

    constructor(int256 _price) {
        price = _price;
    }

    function latestRoundData()
        external
        view
        override
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, price, block.timestamp, block.timestamp, 0);
    }

    function setPrice(int256 _price) external {
        price = _price;
    }
}