# Apollo Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)

## Status

* Timeline
  * 2022-11-10: Spawn time: `2022-11-10T15:00:00.000000Z`
  * 2022-11-09: Proposal 2 voting period ends
  * 2022-11-07: Proposal 2 goes into voting period
  * 2022-11-07: Chain initialized

Apollo will launch as a consumer chain through a governance proposal in the `provider` chain. Read the [Consumer Chain Start Process](/docs/Consumer-Chain-Start-Process.md) page for more details about the workflow.

The following items will be included in the proposal:
* Genesis file hash
  * The SHA256 is used to verify against the genesis file that the proposer has made available for review.
  * This "fresh" genesis file cannot be used to run the chain: it must be updated with the CCV states after the spawn time is reached.
* Binary hash
* Spawn time
  * Even if the proposal passes, the CCV states will not be available from the provider chain until after the spawn time is reached.

## Chain Data

* **Binary: `interchain-security-cd`**
  * [Linux amd64 build](interchain-security-cd), SHA256: `071d7ee2765dc97206391aa64cd42e23e9847c179ab1c4e72eb1811b2c157047`
  * [v0.2.0 version](https://github.com/cosmos/interchain-security/releases/tag/v0.2.0)
* Fresh genesis file: [`apollo-fresh-genesis.json`](apollo-fresh-genesis.json), SHA256: `978853b8e0f57f352916d7c4c5e9226b0e74b2a9f1292a0adcea2aa681c58c40`
* Chain ID: `apollo`
* Denom: `upol`
* Bech32 prefix: `cosmos`

## Endpoints

* **p2p persistent peers : `4b5cee15e6a9c4b96b8c1c4f396a18b0461edc17@104.248.161.33:26656,835173badfc41ecbd867a0395c6a452bda2bb90f@178.62.105.39:26656`**

## Join via Bash Script

On the node machine:
- Copy the `node_key.json` and `priv_validator_key.json` files for your validator.
  - **These should be the same ones as the ones from your provider node**.
- Run one of the following scripts:
  - Sputnik service: [apollo-peer-init.sh](apollo-peer-init.sh)
  - Cosmovisor service: [apollo-peer-init-cv.sh](apollo-peer-init-cv.sh)
- Wait until the spawn time is reached and the genesis file with the CCV states is available.
- Overwrite the genesis file with the one that includes the CCV states.
  - The default location is `$HOME/.apollo/config/genesis.json`.
- Enable and start the service:
  - Apollo
    ```
    sudo systemctl enable apollo
    sudo systemctl start apollo
    ```
  - Cosmovisor
    ```
    sudo systemctl enable cv-apollo
    sudo systemctl start cv-apollo
    ```