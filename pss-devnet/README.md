# Partial Set Security Devnet

[Block explorer](https://explorer.pss-devnet.polypore.xyz)

## Active chains
* [pss-devnet-provider](./pss-devnet-provider/README.md)
* [devnet-topn-one](./devnet-topn-one/README.md)

## Planned events

### Launch a top-N chain (`devnet-topn-one`)

Pre-launch tasks (before spawn time):
* Opt-in with a validator that is not in the top-N

Post-launch tasks:
* Opt-in with a validator that is not in the top-N
* Opt-out with a validator that is not in the top-N
* Get opted in by moving into the top N
* Try (and fail) to opt-out with a validator that is in the top-N
* Set a commission rate
* Try to get jailed after opting out

### Launch an opt-in chain (`devnet-optin-one`)

Pre-launch tasks (before spawn time):
* Opt-in

Post-launch tasks:
* Opt-in
* Opt-out
* Set a commission rate
* Try to get jailed after opting out