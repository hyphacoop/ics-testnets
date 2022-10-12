# Interchain Security Private Testnet

## Joining the Provider Chain

To join the provider chain, you can
- follow a [script-based tutorial](https://github.com/sainoe/ICS-testnet/blob/main/join-testnet-tutorial.md) or
- use an Ansible [inventory file](https://github.com/hyphacoop/cosmos-ansible/tree/main/examples#provider-chain) from the [cosmos-ansible](https://github.com/hyphacoop/cosmos-ansible) repo.

## Starting Consumer Chains

The genesis file of the consumer chain must be updated with the CCV states from the provider chain before the consumer chain binary can start. This can only be done after the SpawnTime specified in the `create-consumer-chain` proposal has been reached.

> See the [Consumer Chain Start Process](/docs/Consumer-Chain-Start-Process.md) page for more details.

## `salt` Consumer Chain

**Status**

* 2022-10-11: The genesis file has been updated with the CCV states from the provider chain
* 2022-10-07: Proposal 12 (_Create the salt consumer chain_) has passed in the provider chain
* 2022-10-05: The genesis file has been initialized

### Details

* Fresh genesis file: `fresh-salt-genesis.json`
* Fresh genesis hash: `831133e22d00a9fcbac551decfd89555c52ae0f038a37f4d88e9479911f1d97a`
* Binary: `salt-interchain-security-cd`
  * [Interchain Security](https://github.com/cosmos/interchain-security.git) v0.1.4
  * Built on x86_64 with go v1.18.5
* Binary hash: `5ae76b4206c0bb8f87208c6ab2b68545fde4cf2c27d53041e24218cab4b3e925`
* **Spawn time: `2022-10-11T14:00:00Z`**
* **Modified genesis file: `ccv-salt-genesis.json`**
* **Persistent peer: `2bd4797ad1812fc7c90737e9ddef38114bd77229@68.183.199.144:26656`**

**❗ The following instructions require a genesis file that has already been updated with the CCV states. This file will not be available until after the SpawnTime is reached.**

### Join via Ansible Playbook

- You must have SSH access to the node machine.
- The binary will be set up for the `salt` user.
- The binary will run through cosmovisor in the `cv-salty.service` service.

On your local machine:
- Copy the `node_key.json` and `priv_validator_key.json` files from your provider chain validator node.
- Clone the [cosmos-ansible](https://github.com/hyphacoop/cosmos-ansible) repo.
- Run the playbook from the [salt Consumer Chain](https://github.com/hyphacoop/cosmos-ansible/tree/main/examples#salt-consumer-chain) example:
  ```bash
  ansible-playbook node.yml -i examples/inventory-join-salt.yml -e 'target=<host address> node_key_file=<JSON file path> priv_validator_key_file=<JSON file path>"'
  ```

### Join via Bash Script

- The binary will run through cosmovisor in the `cv-salty.service` service.

On the node machine:
- Copy the `node_key.json` and `priv_validator_key.json` files from your provider chain validator node.
- You can run [join-salt.sh](join-salt.sh) as root, or [join-salt-non-root.sh](join-salt-non-root.sh) otherwise.

## `pepper` Consumer Chain

### Status

* 2022-10-11: The genesis file has been updated with the CCV states from the provider chain
* 2022-10-07: Proposal 13 (_Create the pepper consumer chain_) has passed in the provider chain
* 2022-10-05: The genesis file has been initialized

### Details

* Fresh genesis file: `fresh-pepper-genesis.json`
* Fresh genesis hash: `a2b1a669f55c583034303ad6a16bd7ff571c42523b3c4bb75dfa8ea4502412d9`
* Binary: `pepper-interchain-security-cd`
  * [Interchain Security](https://github.com/cosmos/interchain-security.git) v0.1.4
  * Built on x86_64 with go v1.18.5
* Binary hash: `2911bd87cb3ecad2574d82f3874c1f8955856bf80d568f86700905d827c7d41b`
* **Spawn time: `2022-10-11T15:00:00Z`**
* **Modified genesis file: `ccv-pepper-genesis.json`**
* **Persistent peer: `2bd4797ad1812fc7c90737e9ddef38114bd77229@159.89.126.190:26656`**

**❗ The following instructions require a genesis file that has already been updated with the CCV states. This file will not be available until after the SpawnTime is reached.**

### Join via Ansible Playbook

- You must have SSH access to the node machine.
- The binary will be set up for the `pepper` user.
- The binary will run through cosmovisor in the `cv-peppy.service` service.

On your local machine:
- Copy the `node_key.json` and `priv_validator_key.json` files from your provider chain validator node.
- Clone the [cosmos-ansible](https://github.com/hyphacoop/cosmos-ansible) repo.
- Run the playbook from the [pepper Consumer Chain](https://github.com/hyphacoop/cosmos-ansible/tree/main/examples#pepper-consumer-chain) example:
  ```bash
  ansible-playbook node.yml -i examples/inventory-join-pepper.yml -e 'target=<host address> node_key_file=<JSON file path> priv_validator_key_file=<JSON file path>"'
  ```

### Join via Bash Script

- The binary will run through cosmovisor in the `cv-peppy.service` service.

On the node machine:
- Copy the `node_key.json` and `priv_validator_key.json` files from your provider chain validator node.
- You can run [join-pepper.sh](join-pepper.sh) as root, or [join-pepper-non-root.sh](join-pepper-non-root.sh) otherwise.
