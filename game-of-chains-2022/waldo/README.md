# waldo Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-12-05: Spawn time: `2022-12-06T17:00:00.000000Z`
  * 2022-11-29: Chain initialized

`waldo` is an audit-only consumer chain proposal!

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time

## Chain Data

### Binary

The binary published in this repo is the `waldod` binary built using the `hyphacoop/cosmos-goc-waldo` repo tag [v0.1.0](https://github.com/strangelove-ventures/waldo/releases/tag/v0.1.0). You can generate the binary following the [build instructions](https://github.com/strangelove-ventures/waldo#instructions) or the build script below.

  * [Linux amd64 build](waldod)
  * SHA256: `ab95aab5f061e724212d5d398f564a9696d43a44a4fb55bb499265f005df1609`

### Genesis file

The genesis file with was generated using the following settings:

* Chain ID: `waldo`
* Denom: `uwaldo`
* Signed blocks window: `"8640"`
* Unbonding period: `"345600s"`
* Two additional genesis accounts were added to provide funds for a faucet and a relayer.
* Genesis file **without CCV state**: [`waldo-fresh-genesis.json`](waldo-fresh-genesis.json), SHA256: `ad2ed599af710b3affe87fcda71cf4bcbffd7d1cd281a1b55e648d3b18caafb1`
  * **This is provided only for verification, this is not the genesis file validators should be running their nodes with.**

## Build Script

- [waldo-build.sh](waldo-build.sh)
