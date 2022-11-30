# Larry Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-12-05: Spawn time: `2022-12-05T15:00:00.000000Z`
  * 2022-11-29: Chain initialized

`larry` is an audit-only consumer chain proposal!

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time

## Chain Data

### Binary

The binary published in this repo is the `larryd` binary built using the `hyphacoop/cosmos-goc-larry` repo tag [v0.1.0](https://github.com/hyphacoop/cosmos-goc-larry/releases/tag/v0.1.0). You can generate the binary following the [build instructions](https://github.com/hyphacoop/cosmos-goc-larry#instructions) or the build script below.

  * [Linux amd64 build](larryd)
  * SHA256: `ec9f75488160e0fb6635a89c4514370ab4cc5d141a9ce1d413b060e9a8dd3d22`

### Genesis file

The genesis file with was generated using the following settings:

* Chain ID: `larry`
* Denom: `ularry`
* Signed blocks window: `"8640"`
* Unbonding period: `"345600s"`
* Two additional genesis accounts were added to provide funds for a faucet and a relayer.
* Genesis file **without CCV state**: [`larry-fresh-genesis.json`](larry-fresh-genesis.json), SHA256: `6a26b52772b2b133bddd3877642db46edf54337b666d3dbbaa2e783446d90816`
  * **This is provided only for verification, this is not the genesis file validators should be running their nodes with.**

## Build Script

- [larry-build.sh](larry-build.sh)
