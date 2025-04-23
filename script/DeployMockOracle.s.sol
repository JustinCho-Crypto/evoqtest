// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import {BTCBMockOracle, BNBMockOracle, USDCMockOracle, USDTMockOracle} from "../src/mocks/MockOracle.sol";

contract DeployBNBMockOracle is Script {
    function run() external {
        vm.startBroadcast();    

        // 초기 가격 1000 USD, decimals = 8 기준 (Chainlink 스타일) - 일단 전부 통일
        BNBMockOracle oracle = new BNBMockOracle(1_000_00000000); // 1000 * 1e8

        vm.stopBroadcast();
    }
}

contract DeployBTCBMockOracle is Script {
    function run() external {
        vm.startBroadcast();

        // 초기 가격 1000 USD, decimals = 8 기준 (Chainlink 스타일)
        BTCBMockOracle oracle = new BTCBMockOracle(1_000_00000000); // 1000 * 1e8

        vm.stopBroadcast();
    }
}

contract DeployUSDCMockOracle is Script {
    function run() external {
        vm.startBroadcast();

        // 초기 가격 1000 USD, decimals = 8 기준 (Chainlink 스타일)
        USDCMockOracle oracle = new USDCMockOracle(1_000_00000000); // 1000 * 1e8

        vm.stopBroadcast();
    }
}

contract DeployUSDTMockOracle is Script {
    function run() external {
        vm.startBroadcast();

        // 초기 가격 1000 USD, decimals = 8 기준 (Chainlink 스타일)
        USDTMockOracle oracle = new USDTMockOracle(1_000_00000000); // 1000 * 1e8

        vm.stopBroadcast();
    }
}