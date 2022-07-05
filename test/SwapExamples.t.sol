// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

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
        vm.label(address(this), "user");
        vm.label(address(swapExamples), "SwapContract");
    }

    function test__SwapExactInputSingle() public {
        uint amountIn = 10e18;
        wethToken.deposit{value: amountIn}();
        wethToken.approve(address(swapExamples), amountIn);

        uint preDiaBalance = daiToken.balanceOf(address(this));
        uint preWethBalance = wethToken.balanceOf(address(this));
        assertEq(preDiaBalance, 0);

        uint amountOut = swapExamples.swapExactInputSingle(amountIn);

        emit log_named_uint("DAI balance", daiToken.balanceOf(address(this)));

        uint postDiaBalance = daiToken.balanceOf(address(this));

        assertEq(amountOut, daiToken.balanceOf(address(this)));
        assertEq(
            daiToken.balanceOf(address(this)),
            preDiaBalance + postDiaBalance
        );
        assertEq(wethToken.balanceOf(address(this)), preWethBalance - amountIn);
    }

    function test__SwapExactOutputSingle() public {
        uint wethAmountInMax = 10e18;
        uint diaAmountOut = 1000e18;

        wethToken.deposit{value: wethAmountInMax}();
        wethToken.approve(address(swapExamples), wethAmountInMax);

        uint wethAmountIn = swapExamples.swapExactOutputSingle(
            diaAmountOut,
            wethAmountInMax
        );

        emit log_named_uint("DAI balance", daiToken.balanceOf(address(this)));
        emit log_named_uint("WETH balance", wethToken.balanceOf(address(this)));

        assertLe(wethAmountIn, wethAmountInMax);
        assertEq(
            wethToken.balanceOf(address(this)),
            wethAmountInMax - wethAmountIn
        );
        assertEq(daiToken.balanceOf(address(this)), diaAmountOut);
    }

    function test__SwapExactInputMultiHop() public {
        uint amountIn = 10e18;
        wethToken.deposit{value: amountIn}();
        wethToken.approve(address(swapExamples), amountIn);

        uint preDiaBalance = daiToken.balanceOf(address(this));
        uint preWethBalance = wethToken.balanceOf(address(this));
        assertEq(preDiaBalance, 0);

        uint amountOut = swapExamples.swapExactInputMultihop(amountIn);

        emit log_named_uint("DAI balance", daiToken.balanceOf(address(this)));

        uint postDiaBalance = daiToken.balanceOf(address(this));

        assertEq(amountOut, daiToken.balanceOf(address(this)));
        assertEq(
            daiToken.balanceOf(address(this)),
            preDiaBalance + postDiaBalance
        );
        assertEq(wethToken.balanceOf(address(this)), preWethBalance - amountIn);
    }

    function test__SwapExactOutputMultihop() public {
        uint wethAmountInMax = 10e18;
        uint diaAmountOut = 1000e18;

        wethToken.deposit{value: wethAmountInMax}();
        wethToken.approve(address(swapExamples), wethAmountInMax);

        uint wethAmountIn = swapExamples.swapExactOutputMultihop(
            diaAmountOut,
            wethAmountInMax
        );

        emit log_named_uint("DAI balance", daiToken.balanceOf(address(this)));
        emit log_named_uint("WETH balance", wethToken.balanceOf(address(this)));

        assertLe(wethAmountIn, wethAmountInMax);
        assertEq(
            wethToken.balanceOf(address(this)),
            wethAmountInMax - wethAmountIn
        );
        assertEq(daiToken.balanceOf(address(this)), diaAmountOut);
    }
}
