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
  * [Block Explorer](https://provider-explorer.goc.earthball.xyz)
  * [Ping Dashboard](https://testnet.ping.pub/provider)

* Timeline
  * 2022-12-06: Software upgrade proposal submitted to upgrade to `goc-december` version at block height `480681`.
  * 2022-11-10: New gaiad binary published to bump ICS to `v0.2.1`.
  * 2022-11-07: Chain started.

## Chain Data

**`goc-december` version (upgrade target for block 480681):**

---
* Binary: `gaiad`
  * [Linux amd64 build](gaiad-goc-december)
  * [glnro/ics-sdk45 branch](https://github.com/cosmos/gaia/tree/glnro/ics-sdk45)
  * Commit `b56fe257ec4c5647bdc105602b57273936b714eb`
* Binary SHA256: `a23b9c9f320b047ffe63db738defeda12c22a29e5d8572a3a545213dd729b5a8`
---

**`ICS v0.2.1` version (current):**

---
* Binary: `gaiad`
  * [Linux amd64 build](gaiad)
  * [ICS v0.2.1 fork](https://github.com/smarshall-spitzbart/gaia/tree/glnro/ics-sdk45)
  * Commit `f729517a4a231a02172df6763c2ffed0524a2804`
* Binary SHA256: `d1dc6d31671a56b995cc8fab639a4cae6a88981de05d42163351431b8a6691cf`
---

* Genesis file: [provider-genesis.json](https://raw.githubusercontent.com/hyphacoop/ics-testnets/main/game-of-chains-2022/provider/provider-genesis.json)
* Chain ID: `provider`
* Denom: `uprov`
* Bech32 prefix: `cosmos`

## ⛔ ATTENTION ⛔

**2022-11-30 19:00 UTC** 
- A software upgrade proposal will be submitted to upgrade the provider chain binary to version `goc-december`.
- The upgrade height will be `480681`.

**2022-11-10 13:00 UTC** 
- The gaiad version used to launch the provider chain is now considered to be deprecated. The section below has been kept for reference only.

**2022-11-09 21:18 UTC**
- We are expecting a new version of the provider chain binary to fix a critical Interchain Security-related bug. New version expected on Nov 10 at the earliest.

**Deprecated:**

---
* Binary: `gaiad`
  * [Linux amd64 build](gaiad-ics-0.2.0-do-not-use.gz)
  * [ICS v0.2.0 fork](https://github.com/jtremback/gaia/tree/glnro/ics-sdk45)
  * Commit 84a33e4910abcc157f3333a70918a4fd6dc4cf6d
* Binary SHA256: `02e3d748d851f6ce935f1074307ebfa83f40a417ad6668928f7aa28d4149c671`

---

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

## Upgrading to `goc-december`

The binary used on the provider chain starting from block height 53094 (ICS `v0.2.1`) will be upgraded to the `goc-december` version at block height 480681.

You can either build a new binary or download the one in this folder, and follow the steps below:
- Stand-alone `gaiad`
  - Stop the service running `gaiad`
  - Replace the `gaiad` binary in the `~/go/bin/` folder
  - Start the service running `gaiad`
- Cosmovisor
  - **Before the upgrade block height is reached:**
    - Stop the service running Cosmovisor
    - Set the `DAEMON_ALLOW_DOWNLOAD_BINARIES` variable to `false`
    - Copy the new binary to `~/.gaia/cosmovisor/upgrades/goc-december/bin/gaiad`
    - Start the service running Cosmovisor
 
After upgrading you should see the version below:
```
gaiad version
HEAD-b56fe257ec4c5647bdc105602b57273936b714eb
```

## Upgrading to ICS v0.2.1

The binary used to start the provider (ICS `v0.2.0`) has been deprecated. You can either build a new binary or download the one in this folder.

- Stand-alone `gaiad`
  - Stop the service running `gaiad`
  - Replace the `gaiad` binary in the `~/go/bin/` folder
  - Start the service running `gaiad`
- Cosmovisor
  - Stop the service running Cosmovisor
  - Replace the `gaiad` binary in the `~/.gaia/cosmovisor/current/bin/` folder
  - Start the service running Cosmovisor

After upgrading you should see the version below:
```
gaiad version
glnro/ics-sdk45-f729517a4a231a02172df6763c2ffed0524a2804
```


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
