# Sputnik Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-11-10: Spawn time: `2022-11-10T14:00:00.000000Z`
  * 2022-11-09: Proposal 1 voting period ends
  * 2022-11-07: Proposal 1 goes into voting period
  * 2022-11-07: Chain initialized

Sputnik will launch as a consumer chain through a governance proposal in the `provider` chain. Read the [Consumer Chain Start Process](/docs/Consumer-Chain-Start-Process.md) page for more details about the workflow.

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time
  * Even if the proposal passes, the CCV states will not be available from the provider chain until after the spawn time is reached.

## Chain Data

* **Binary: `interchain-security-cd`**
  * [Linux amd64 build](interchain-security-cd), SHA256: `982f34f8edae365b6da5f8cb32fbe1f61f0317348663a21b5ebd6b21996760b9`
  * [v0.2.0 version](https://github.com/cosmos/interchain-security/releases/tag/v0.2.0)
* Fresh genesis file: [`sputnik-fresh-genesis.json`](sputnik-fresh-genesis.json), SHA256: `ec5f03d8d3be2fbd3e8bd87c113379b671c300eeb8295863f785237e020040a9`
* Chain ID: `sputnik`
* Denom: `unik`
* Bech32 prefix: `cosmos`

## Endpoints

* **p2p persistent peers : `4b5cee15e6a9c4b96b8c1c4f396a18b0461edc17@46.101.106.107:26656,835173badfc41ecbd867a0395c6a452bda2bb90f@134.209.255.244:26656`**

## Join via Bash Script

On the node machine:
- Copy the `node_key.json` and `priv_validator_key.json` files for your validator.
  - **These should be the same ones as the ones from your provider node**.
- Run one of the following scripts:
  - Sputnik service: [sputnik-peer-init.sh](sputnik-peer-init.sh)
  - Cosmovisor service: [sputnik-peer-init-cv.sh](sputnik-peer-init-cv.sh)
- Wait until the spawn time is reached and the genesis file with the CCV states is available.
- Overwrite the genesis file with the one that includes the CCV states.
  - The default location is `$HOME/.sputnik/config/genesis.json`.
- Enable and start the service:
  - Sputnik
    ```
    sudo systemctl enable sputnik
    sudo systemctl start sputnik
    ```
  - Cosmovisor
    ```
    sudo systemctl enable cv-sputnik
    sudo systemctl start cv-sputnik
    ```