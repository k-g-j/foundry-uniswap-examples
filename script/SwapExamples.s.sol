// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Script.sol";
import {SwapExamples} from "src/SwapExamples.sol";

contract SwapExamplesDeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new SwapExamples();
        vm.stopBroadcast();
    }
}
