# Sputnik Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-11-07: Chain initialized

Sputnik will launch as a consumer chain through a governance proposal in the `provider` chain. Read the [Consumer Chain Start Process](/docs/Consumer-Chain-Start-Process.md) page for more details about the workflow.

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time
  * Even if the proposal passes, the CCV states will not be available from the provider chain until the spawn time is reached.

## Chain Data

* **Binary: `interchain-security-cd`**
  * [Linux amd64 build](interchain-security-cd)
  * [v0.2.0 version](https://github.com/cosmos/interchain-security/releases/tag/v0.2.0)
* Binary SHA256: `982f34f8edae365b6da5f8cb32fbe1f61f0317348663a21b5ebd6b21996760b9`
* **Fresh genesis file: `sputnik-fresh-genesis.json`**
* Genesis SHA256: `ec5f03d8d3be2fbd3e8bd87c113379b671c300eeb8295863f785237e020040a9`
* Chain ID: `sputnik`
* Denom: `unik`
* Bech32 prefix: `cosmos`
