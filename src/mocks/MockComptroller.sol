// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVToken {
    function underlying() external view returns (address);
}

interface IAggregator {
    function latestRoundData()
        external
        view
        returns (
            uint80,
            int256 answer,
            uint256,
            uint256,
            uint80
        );
}

contract MockComptroller {
    mapping(address => address) public assetToOracle;
    address public defaultOracle; 

    function setOracle(address asset, address oracle) external {
        assetToOracle[asset] = oracle;
        defaultOracle = oracle; // 가장 최근 등록한 oracle을 기본으로 사용
    }

    function getUnderlyingPrice(address vToken) external view returns (uint256) {
        address underlying = IVToken(vToken).underlying();
        address oracle = assetToOracle[underlying];
        require(oracle != address(0), "No oracle set");

        (, int256 price,,,) = IAggregator(oracle).latestRoundData();
        return uint256(price);
    }

    function oracle() external view returns (address) {
        return defaultOracle;
    }
}