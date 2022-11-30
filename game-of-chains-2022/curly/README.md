# Curly Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-12-05: Spawn time: `2022-12-05T16:00:00.000000Z`
  * 2022-11-29: Chain initialized

`curly` is an audit-only consumer chain proposal!

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time

## Chain Data

### Binary

The binary published in this repo is the `curlyd` binary built using the `hyphacoop/cosmos-goc-curly` repo tag [v0.1.0](https://github.com/hyphacoop/cosmos-goc-curly/releases/tag/v0.1.0). You can generate the binary following the [build instructions](https://github.com/hyphacoop/cosmos-goc-curly#instructions) or the build script below.

  * [Linux amd64 build](curlyd)
  * SHA256: `f4f48134e26e348630cc5afb81ce067bea797a325af60a94898edc607d519b0f`

### Genesis file

The genesis file with was generated using the following settings:

* Chain ID: `curly`
* Denom: `ucurly`
* Signed blocks window: `"8640"`
* Unbonding period: `"345600s"`
* Two additional genesis accounts were added to provide funds for a faucet and a relayer.
* Genesis file **without CCV state**: [`curly-fresh-genesis.json`](curly-fresh-genesis.json), SHA256: `a95cf5439f7c33b7a659055e26546490165adf7d0f59db50c0820c756695984b`
  * **This is provided only for verification, this is not the genesis file validators should be running their nodes with.**

## Build Script

- [curly-build.sh](curly-build.sh)
