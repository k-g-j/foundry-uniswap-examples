// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/LiquidityExamples.sol";
import "src/interfaces/IERC20.sol";

contract SwapExamplesTest is Test {
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address private constant DAI_WHALE =
        0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2;
    address private constant USDC_WHALE =
        0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2;

    LiquidityExamples liquidityExamples;
    IERC20 daiToken = IERC20(DAI);
    IERC20 usdcToken = IERC20(USDC);

    function setUp() public {
        liquidityExamples = new LiquidityExamples();
        vm.label(address(this), "user");
        vm.label(address(liquidityExamples), "LiquidityContract");
    }
}
