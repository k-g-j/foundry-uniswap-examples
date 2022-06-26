// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/SwapExamples.sol";
import "src/interfaces/IWETH.sol";

contract SwapExamplesTest is Test {
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    SwapExamples swapExamples;
    IWETH wethToken = IWETH(WETH9);
    IERC20 daiToken = IERC20(DAI);

    function setUp() public {
        swapExamples = new SwapExamples();
    }

    function testExample() public {
        assertTrue(true);
    }
}
