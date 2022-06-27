# UNISWAP SINGLE AND MULTISWAP FOUNDRY PROJECT

## Description

This repo provides code for using the single and multihop swap functions of UniswapV3.
For more information on the UniswapV3 contracts check the [documentation](https://docs.uniswap.org/protocol/guides/swaps/single-swaps).

## Installation

1. Run "foundyup" to make sure you have the latest version of foundry [installed](https://github.com/foundry-rs/foundry)

2. Create a .env file at the route of your project with ```MAINNET_FORKING_URL=``` and set the url as an RPC url from Alchemy, Infuria, Moralis etc . . .

3. To run the test:
   - "source .env"
   - "forge test --fork-url $MAINNET_FORKING_URL -vv"
