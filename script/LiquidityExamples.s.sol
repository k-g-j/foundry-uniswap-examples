// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Script.sol";
import {LiquidityExamples} from "src/LiquidityExamples.sol";

contract LiquidityExamplesDeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new LiquidityExamples();
        vm.stopBroadcast();
    }
}
