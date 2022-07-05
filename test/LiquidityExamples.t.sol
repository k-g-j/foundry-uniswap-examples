// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.6;

import "forge-std/Test.sol";
import "src/LiquidityExamples.sol";

contract LiquidityExamplesTest is Test {
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address private constant DAI_WHALE =
        0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2;
    address private constant USDC_WHALE =
        0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2;

    LiquidityExamples liquidityExamples;
    IERC20 daiToken = IERC20(DAI);
    IERC20 usdcToken = IERC20(USDC);
    uint daiAmount = 100e18;
    uint usdcAmount = 100e6;

    function setUp() public {
        liquidityExamples = new LiquidityExamples();
        vm.label(address(this), "user");
        vm.label(address(liquidityExamples), "LiquidityContract");
        assertGt(daiToken.balanceOf(DAI_WHALE), daiAmount);
        assertGt(usdcToken.balanceOf(address(USDC_WHALE)), usdcAmount);
        vm.startPrank(DAI_WHALE);
        daiToken.approve(address(this), daiAmount);
        daiToken.transfer(address(this), daiAmount);
        vm.stopPrank();
        vm.startPrank(USDC_WHALE);
        usdcToken.approve(address(this), usdcAmount);
        usdcToken.transfer(address(this), usdcAmount);
        vm.stopPrank();
    }

    function test__mintNewPosition() public {
        daiToken.approve(address(liquidityExamples), daiAmount);
        daiToken.transfer(address(liquidityExamples), daiAmount);
        usdcToken.approve(address(liquidityExamples), usdcAmount);
        usdcToken.transfer(address(liquidityExamples), usdcAmount);
        emit log_named_uint("DAI balance after add liquidity", daiToken.balanceOf(address(liquidityExamples)));
        emit log_named_uint("USDC balance after add liquidity", usdcToken.balanceOf(address(liquidityExamples)));
        (uint tokenId, uint liquidity, uint amount0, uint amount1) = liquidityExamples.mintNewPosition();
        assertGt(tokenId, 0);
        assertGt(liquidity, 0);
        emit log_named_uint("Token id", tokenId);
        emit log_named_uint("Liquidity", liquidity);
        emit log_named_uint("amount0", amount0);
        emit log_named_uint("amount1", amount1);
        emit log_named_uint("DAI balance after add liquidity", daiToken.balanceOf(address(liquidityExamples)));
        emit log_named_uint("USDC balance after add liquidity", usdcToken.balanceOf(address(liquidityExamples)));
    }
}
