# devnet-optin-one Chain Information

* Chain ID: `devnet-optin-one`
* Denom: `uopt`
* Top N: `0`
* Bech32 prefix: `consumer`
* Binary
  * `interchain-security-cd`
  * Built to the [`pss-devnet-1`](https://github.com/cosmos/interchain-security/releases/tag/pss-devnet-1) tag in the `cosmos/interchain-security` repo
  * Built with Go 1.21.8
  * SHASUM: `992b8bc2f3f7e4e56371d54515b753ac88ce334dd48b028db25caae7ba438b2e` (verify with `shasum -a 256 interchain-security-cd`)
* Launch date: 2024-04-05

## Consumer launch

* Pre-spawn time genesis file
  * [`optin-one-genesis-pre-spawn.json`](./optin-one-genesis-pre-spawn.json)
  * SHASUM: `c97d31ddcb941591970a7a4ddc93e44868e9fd86aa452cfe451712b6554ae1d9` (verify with `shasum -a 256 optin-one-genesis-pre-spawn.json`)
* Spawn time: `2024-04-12T14:30:00Z`
* **Launch genesis file**
  * `optin-one-genesis.json`
  * SHASUM: `af7174dca2049b4a3934d513245e960ddfaa85f76926a65c0283af683700f3bb` (verify with `shasum -a 256 optin-one-genesis.json`)

## Endpoints

### Persistent peers

* Hypha validator: `aa61ac6b0d6c8a80f9ad2c216b72774a07c5f1db@optin-one-val.pss-devnet.polypore.xyz:26656`
* Hypha full node: `cf4ba959d56860137d9c3acfc98d5d49b07832e2@optin-one-node.pss-devnet.polypore.xyz:26656`

### State sync

* https://rpc.optin-one-node.pss-devnet.polypore.xyz:443

## Preparing for Launch

### Node Setup

The `setup-optin-one.sh` script provided in this repo will install the chain binary.
* It must be run either as root or from a sudoer account.
* The script will build the `interchain-security-cd` binary using Go 1.21.8.

### Joining the Consumer Chain Validator Set Before Spawn Time

* To opt-in, you must submit an opt-in transaction **before the voting period ends** for the `consumer-addition` proposal.
  ```
  interchain-security-pd tx provider opt-in devnet-optin-one <consumer node public key>
  ```

## Launch Instructions

After the spawn time is reached:
  * The launch genesis file will be posted in this repo.
  * Copy this file to your consumer chain's home `/config/genesis.json`.
  * Start your node

### Preparing the genesis file

These are the commands we will use to generate the launch genesis file after the spawn time is reached:

* Obtain CCV state
* Populate reward denoms
* Populate provider reward denoms
* Patch the consumer genesis file
```
interchain-security-pd q provider consumer-genesis devnet-optin-one -o json > ccv.json
jq '.params.reward_denoms |= ["uopt"]' ccv.json > ccv-denom.json
jq '.params.provider_reward_denoms |= ["uprov"]' ccv-denom.json > ccv-provider-denom.json
jq -s '.[0].app_state.ccvconsumer = .[1] | .[0]' genesis.json ccv-provider-denom.json > optin-one-genesis.json
```

### Joining the Consumer Chain Validator Set After Launch

* If you didn't opt in while the `consumer-addition` proposal was in voting period, you can submit an opt-in transaction after the consumer chain has launched.
  ```
  interchain-security-pd tx provider opt-in devnet-optin-one <consumer node public key>
  ```
