# Moe Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-12-05: Spawn time: `2022-12-05T17:00:00.000000Z`
  * 2022-11-29: Chain initialized

`moe` is an audit-only consumer chain proposal!

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time

## Chain Data

### Binary

The binary published in this repo is the `moed` binary built using the `hyphacoop/cosmos-goc-moe` repo tag [v0.1.0](https://github.com/hyphacoop/cosmos-goc-moe/releases/tag/v0.1.0). You can generate the binary following the [build instructions](https://github.com/hyphacoop/cosmos-goc-moe#instructions) or the build script below.

  * [Linux amd64 build](moed)
  * SHA256: `d6729adf4bc138ca45540d4505d00f5eab78eadda6c18240148ef4e2ff56df20`

### Genesis file

The genesis file with was generated using the following settings:

* Chain ID: `moe`
* Denom: `umoe`
* Signed blocks window: `"8640"`
* Unbonding period: `"345600s"`
* Two additional genesis accounts were added to provide funds for a faucet and a relayer.
* Genesis file **without CCV state**: [`moe-fresh-genesis.json`](moe-fresh-genesis.json), SHA256: `72e09b5f5348cc59fefbc6e6f99c5297c53a10eda92e5b2603389a2d653b8bb3`
  * **This is provided only for verification, this is not the genesis file validators should be running their nodes with.**

## Build Script

- [moe-build.sh](moe-build.sh)
