# pss-devnet-topn Chain Information

* Chain ID: `devnet-topn-one`
* Denom: `utop`
* Top N: `66`
* Bech32 prefix: `consumer`
* Binary
  * `interchain-security-cd`
  * Built to the [`pss-devnet-1`](https://github.com/cosmos/interchain-security/releases/tag/pss-devnet-1) tag in the `cosmos/interchain-security` repo
  * Built with Go 1.21.8
  * SHASUM: `992b8bc2f3f7e4e56371d54515b753ac88ce334dd48b028db25caae7ba438b2e` (verify with `shasum -a 256 topn-genesis-pre-spawn.json`)
* Launch date: 2024-04-05

## Consumer launch

* Pre-spawn time genesis file
  * [`topn-one-genesis-pre-spawn.json`](./topn-one-genesis-pre-spawn.json)
  * SHASUM: `c32365b7ce2b091eada3ff1d2f5adc19a5864939635c3e59b70c46a270d67dd0` (verify with `shasum -a 256 topn-one-genesis-pre-spawn.json`)
* Spawn time: `2024-04-05T14:30:00Z`
* **Launch genesis file**
  * `topn-one-genesis.json`
  * SHASUM: `50686f392e413be31f804e8a791eab777b110e2f2e8de1bfb0499d0938edd12a` (verify with `shasum -a 256 topn-one-genesis.json`)

## Endpoints

### Persistent peers

* Hypha validator: `ddd8f2add13abcaf96c6929419b52452ec5c6e3a@topn-one-val.pss-devnet.polypore.xyz:26656`
* Hypha full node: `244a3738d325ea5873a8d0262a64e8369e583772@topn-one-node.pss-devnet.polypore.xyz:26656`

### State sync

* https://rpc.topn-one-node.pss-devnet.polypore.xyz:443

## Preparing for Launch

### Node Setup

The `setup-devnet-topn.sh` script provided in this repo will install the chain binary.
* It must be run either as root or from a sudoer account.
* The script will build the `interchain-security-cd` binary using Go 1.21.8.

### Joining the Consumer Chain Validator Set Before Spawn Time

If you are in the top N of the validator set when the spawn time is reached:
* You will be automatically opted in to this chain's validator set, and you must run a node.
* You must assign a consensus key **before the spawn time is reached**.
  ```
  interchain-security-pd tx provider assign-consensus-key devnet-topn-one <consumer node public key>
  ```

If you are not in the top N of the validator set:
* You have the option to opt-in to this chain's validator set.
* To opt-in, you can submit an opt-in transaction **before the voting period ends** for the `consumer-addition` proposal.
  ```
  interchain-security-pd tx provider opt-in devnet-topn-one <consumer node public key>
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
interchain-security-pd q provider consumer-genesis devnet-topn-one -o json > ccv.json
jq '.params.reward_denoms |= ["utop"]' ccv.json > ccv-denom.json
jq '.params.provider_reward_denoms |= ["uprov"]' ccv-denom.json > ccv-provider-denom.json
jq -s '.[0].app_state.ccvconsumer = .[1] | .[0]' genesis.json ccv-provider-denom.json > topn-one-genesis.json
```

### Joining the Consumer Chain Validator Set After Launch

If you are not in the top N of the validator set and you didn't opt in while the `consumer-addition` proposal was in voting period:
* You can submit an opt-in transaction after the consumer chain has launched.
  ```
  interchain-security-pd tx provider opt-in devnet-topn-one <consumer node public key>
  ```

## How to Join

The `join-topn-one.sh` script provided in this repo will install the chain binary.
* It must be run either as root or from a sudoer account.
* The script will build the `interchain-security-cd` binary using Go 1.21.8.
* State sync is turned on by default, but you can turn it off. The full node has pruning set to nothing and will sync all the blocks starting from height 1.