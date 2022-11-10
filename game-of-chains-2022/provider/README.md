# Provider Chain Information

Contents

* [Status](#status)
* [Chain Data](#chain-data)
* [Endpoints](#endpoints)
* [Join via Ansible Playbook](#join-via-ansible-playbook)
* [Join via Bash Script](#join-via-bash-script)
* [Getting Tokens](#getting-tokens)
* [Creating a Validator](#creating-a-validator)

## Status

* Provider chain 
  - [block explorer](https://provider-explorer.goc.earthball.xyz)
  - [Ping Dashboard](https://testnet.ping.pub/provider)
* Timeline
  * 2022-11-07: Chain started

## Chain Data

**-- ATTENTION --**  
**-- 2022-11-09 21:18 UTC --**  
**We are expecting a new version of the provider chain binary to fix a critical Interchain Security-related bug. New version expected on Nov 10 at the earliest.**

* Binary: `gaiad`
  * [Linux amd64 build](gaiad)
  * [glnro/ics-sdk45 branch](https://github.com/jtremback/gaia/tree/glnro/ics-sdk45)
  * Commit 84a33e4910abcc157f3333a70918a4fd6dc4cf6d
* Binary SHA256: `02e3d748d851f6ce935f1074307ebfa83f40a417ad6668928f7aa28d4149c671`
* Genesis file: [provider-genesis.json](https://raw.githubusercontent.com/hyphacoop/ics-testnets/main/game-of-chains-2022/provider/provider-genesis.json)
* Chain ID: `provider`
* Denom: `uprov`
* Bech32 prefix: `cosmos`

## Endpoints

* **p2p seeds : `7a86ddc92f56e77a26c4fb4d543412f7175a7c9b@143.198.45.140:26656,8372500f2d1dfdcfbf9f0eccceb5e98d37f07b80@tenderseed.ccvalidators.com:29009`**
* Sentry 1
  * RPC: https://rpc.provider-sentry-01.goc.earthball.xyz
  * P2P: https://p2p.provider-sentry-01.goc.earthball.xyz
  * API: https://rest.provider-sentry-01.goc.earthball.xyz
  * gRPC: https://grpc.provider-sentry-01.goc.earthball.xyz
* Sentry 2
  * RPC: https://rpc.provider-sentry-02.goc.earthball.xyz
  * P2P: https://p2p.provider-sentry-02.goc.earthball.xyz
  * API: https://rest.provider-sentry-02.goc.earthball.xyz
  * gRPC: https://grpc.provider-sentry-02.goc.earthball.xyz
* Seed
  * RPC: https://rpc.provider-seed-01.goc.earthball.xyz
  * P2P: https://p2p.provider-seed-01.goc.earthball.xyz
  * API: https://rest.provider-seed-01.goc.earthball.xyz
  * gRPC: https://grpc.provider-seed-01.goc.earthball.xyz

## Join via Ansible Playbook

- You must have SSH access to the node machine.
- The binary will be set up for the `provider` user.
- The binary will run through cosmovisor in the `cv-provider.service` service.

On your local machine:
- Copy the `node_key.json` and `priv_validator_key.json` files from your provider chain validator node.
- Clone the [cosmos-ansible](https://github.com/hyphacoop/cosmos-ansible) repo.
- Run the playbook from the [Join the Provider Chain](https://github.com/hyphacoop/cosmos-ansible/tree/main/game-of-chains-2022#join-the-provider-chain) section:
  ```bash
  ansible-playbook node.yml -i game-of-chains-2022/provider/provider-join.yml -e 'target=<host address> node_key_file=<JSON file path> priv_validator_key_file=<JSON file path>"'
  ```

## Join via Bash Script

On the node machine:
- Copy the `node_key.json` and `priv_validator_key.json` files for your validator.
- Run one of the following scripts:
  - Gaia service: [provider-join.sh](provider-join.sh)
  - Cosmovisor service: [provider-join-cv.sh](provider-join-cv.sh)

## Getting Tokens

Testnet coordinators will distribute provider chain tokens to eligible participants.

## Creating a Validator

Once you have some tokens in your self-delegation account, you can submit the `create-validator` transaction.

1. Obtain the validator public key
```
gaiad tendermint show-validator
```

2. Sumbit the `create-validator` transaction.
```bash
gaiad tx staking create-validator \
--amount 1000000uprov \
--pubkey '<public key from the previous command>' \
--moniker <your moniker> \
--chain-id provider \
--commission-rate 0.10 \
--commission-max-rate 1.00 \
--commission-max-change-rate 0.1 \
--min-self-delegation 1000000 \
--gas auto \
--from <self-delegation-account>
```

You can verify the validator was created in the block explorer, or in the command line:
```
gaiad q staking validators -o json | jq '.validators[].description.moniker'
```
