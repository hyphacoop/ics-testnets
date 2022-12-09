# December 8 Chain Halt

## Context
* Provider chain halted at height `484893`
* Provider chain was running code at this [git commit](https://github.com/cosmos/gaia/commit/2627f224c78010c1884f7e8da3d9ce0d5b54a812)
* The chain halted as soon as the `slasher` chain started relaying slash packets. The code for the slasher chain is [here](https://github.com/cosmos/interchain-security/tree/sainoe/malicious-consumer)
* The slasher was intended to test out the "slash rate limiting" feature of Interchain Security. This is intended to stop a consumer chain from slashing every validator on the provider at once. To test this, we created a malicious consumer chain in the GoC testnet that would try to slash every validator at once.