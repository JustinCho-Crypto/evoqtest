// script/DeployMockComptroller.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import {MockComptroller} from "../src/mocks/MockComptroller.sol";

contract DeployMockComptroller is Script {
    function run() external {
        vm.startBroadcast();

        MockComptroller comptroller = new MockComptroller();

        vm.stopBroadcast();
    }
}