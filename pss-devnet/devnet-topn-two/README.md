# devnet-topn-two Chain Information

* Chain ID: `devnet-topn-two`
* Denom: `utop`
* Top N: `80`
* Bech32 prefix: `consumer`
* Binary
  * `interchain-security-cd`
  * Built to the [`pss-devnet-1`](https://github.com/cosmos/interchain-security/releases/tag/pss-devnet-1) tag in the `cosmos/interchain-security` repo
  * Built with Go 1.21.8
  * SHASUM: `992b8bc2f3f7e4e56371d54515b753ac88ce334dd48b028db25caae7ba438b2e` (verify with `shasum -a 256 interchain-security-cd`)
* Launch date: 2024-04-19

## Consumer launch

* Pre-spawn time genesis file
  * [`topn-two-genesis-pre-spawn.json`](./topn-two-genesis-pre-spawn.json)
  * SHASUM: `146155e2fd60b0ea287e5bd7195e8d6d0e77e1f5cc9db1e491db4bf38e7236f8` (verify with `shasum -a 256 topn-two-genesis-pre-spawn.json`)
* Spawn time: `2024-04-19T14:30:00Z`
* **Launch genesis file**
  * [`topn-two-genesis.json`](./topn-two-genesis.json)
  * SHASUM: `38bf8472c069666a8c426b24b23d70a1f931d47f22689b326a511028b4890084` (verify with `shasum -a 256 topn-two-genesis.json`)

## Endpoints

### Persistent peers

* Hypha validator: `de02b43bebae7ad3612d0cb88edcc44028d21f3e@topn-two-val.pss-devnet.polypore.xyz:26656`
* Hypha full node: `1b13a08027b315becae30785d0eb15cffff6ba5f@topn-two-node.pss-devnet.polypore.xyz:26656`

### State sync

* https://rpc.topn-two-node.pss-devnet.polypore.xyz:443

## Preparing for Launch

### Node Setup

The `setup-devnet-topn-two.sh` script provided in this repo will install the chain binary.
* It must be run either as root or from a sudoer account.
* The script will build the `interchain-security-cd` binary using Go 1.21.8.

### Joining the Consumer Chain Validator Set Before Spawn Time

If you are in the top N of the validator set when the spawn time is reached:
* You will be automatically opted in to this chain's validator set, and you must run a node.
* You must assign a consensus key **before the spawn time is reached**.
  ```
  interchain-security-pd tx provider assign-consensus-key devnet-topn-two <consumer node public key>
  ```

If you are not in the top N of the validator set:
* You have the option to opt-in to this chain's validator set.
* To opt-in, you can submit an opt-in transaction **before the voting period ends** for the `consumer-addition` proposal.
  ```
  interchain-security-pd tx provider opt-in devnet-topn-two <consumer node public key>
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
interchain-security-pd q provider consumer-genesis devnet-topn-two -o json > ccv.json
jq '.params.reward_denoms |= ["utop"]' ccv.json > ccv-denom.json
jq '.params.provider_reward_denoms |= ["uprov"]' ccv-denom.json > ccv-provider-denom.json
jq -s '.[0].app_state.ccvconsumer = .[1] | .[0]' genesis.json ccv-provider-denom.json > topn-two-genesis.json
```

### Joining the Consumer Chain Validator Set After Launch

If you are not in the top N of the validator set and you didn't opt in while the `consumer-addition` proposal was in voting period:
* You can submit an opt-in transaction after the consumer chain has launched.
  ```
  interchain-security-pd tx provider opt-in devnet-topn-two <consumer node public key>
  ```
