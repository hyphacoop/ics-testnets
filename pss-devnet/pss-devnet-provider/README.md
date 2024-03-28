# pss-devnet-provider Chain Information

* Chain ID: `pss-devnet-provider`
* Denom: `uprov`
* Current binary
  * `interchain-security-pd`
  * Built to `cosmos/interchain-security` commit [22ca56194b5a64a9d65b0e007a83b8640a6c60a9](https://github.com/cosmos/interchain-security/commit/22ca56194b5a64a9d65b0e007a83b8640a6c60a9)
  * Built with Go 1.21.8
* Genesis file
  * [`provider-genesis.json`](https://github.com/hyphacoop/ics-testnets/raw/main/pss-devnet/pss-devnet-provider/provider-genesis.json)
  * SHASUM: `ce177884620dfb2a90a5908fd348c1d9030cdbbb8d4de419022aebf2f1f3e42a` (verify with `shasum -a 256 provider-genesis.json`)
* Launch date: 2024-03-27
* Launch ICS version: commit [22ca56194b5a64a9d65b0e007a83b8640a6c60a9](https://github.com/cosmos/interchain-security/commit/22ca56194b5a64a9d65b0e007a83b8640a6c60a9)

## Endpoints

### Persistent peers

* Hypha validator: `f048c1ad444283d7ada07b834202e89aa84dbe87@provider-validator.pss-devnet.polypore.xyz:26656`
* Hypha full node: `fc5ccc76afa8397d66a34733e8bf89e471751648@provider-node.pss-devnet.polypore.xyz:26656`

### State sync

* https://rpc.provider-node.pss-devnet.polypore.xyz:443

## How to Join

The `join-devnet-provider.sh` script provided in this repo will install the chain binary.
* It must be run either as root or from a sudoer account.
* The script will build the `interchain-security-pd` binary using Go 1.21.8.
* State sync is turned on by default, but you can turn it off. The full node has pruning set to nothing and will sync all the blocks starting from height 1.

**Please message somebody from the Hypha team with your wallet address and we will send funds to create a validator with.**