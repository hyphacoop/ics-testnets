![Game of Chains logo](https://i.imgur.com/0yIcvUg.jpg)

# Game of Chains

Game of Chains (GoC) is an incentivized testnet program that will help validators develop confidence around Interchain Security (ICS) and provide a public platform where this new technology can be thoroughly tested.

We have a number of rewards planned for GoC! Please remember that:
* **Only Cosmos Hub validators in the active set are eligible to earn rewards in the Game of Chains testnet program.**
* **Validators operated by employees of Informal Systems, Hypha, and Interchain Foundation are eligible to participate, but ineligible for rewards.** 

**Table of Contents**

- [How to Join](#How-to-Join)
- [Overview](#Overview)
- [Disclaimers](#Disclaimers)
- [Timeline](#Timeline)
- [Points System](#Points-System)
- [Rules](#Rules)


## How to Join

Fill out **[this form](https://interchainsecurity.dev/game-of-chains-2022)** to register in the program. 

A form will be made available in the Discord channel to request faucet tokens in the provider chain.

### Joining the Testnet

## ⛔ ATTENTION ⛔

- **2022-11-10 13:00 UTC**
  - The gaiad version used to launch the provider chain is now considered to be deprecated. Visit the provider [chain data](provider/README.md#chain-data) section for additional information about the current gaiad version.

* [Provider chain information](provider/README.md)
* [Sputnik chain information](sputnik/README.md)
* [Apollo chain information](apollo/README.md)
* [Hero chain information](hero/README.md)
* [Neutron chain information](neutron/README.md)
* [Gopher chain information](gopher/README.md)
* [Larry chain information](larry/README.md)
* [Curly chain information](curly/README.md)
* [Moe chain information](moe/README.md)

## Overview

Through the various GoC phases, validators are expected to build an understanding of ICS and help us discover interesting attack vectors. 

The testnet infrastructure will include:
- Provider chain
- Multiple consumer chains
- IBC relayers
- Support services

The provider chain will be started by testnet coordinators (Hypha, Informal, and Interchain, who will control a majority of the stake), and joined by all participating validators. It will function as an analogue of the Cosmos Hub. Its governance parameters will provide short voting periods to accelerate the creation of consumer chains.

Testnet coordinators will prepare and coordinate the start of several consumer chains. One consumer chain will be stopped halfway through the testnet program, and another one at the very end.

After the planned consumer chains have been successfully started, validators will be encouraged to start and stop any number of additional consumer chains for the remainder of the program. This will require some coordination with other validators to have proposals passed and ensure their consumer chains start.

Testnet coordinators will provide guidance on how to join the testnet using scripts, Ansible playbooks, and required data (genesis files, peers, etc.) for the provider and planned consumer chains using this repo. 

Testnet coordinators will operate IBC relayers between the provider and planned consumer chains for the duration of the program.

Testnet coordinators will make the following support services available for the provider and planned consumer chains:

- Block explorer
- Faucets
- Consensus monitors

A leaderboard with validator standings will be available at https://interchainsecurity.dev/game-of-chains-2022#scoreboard.

💬 Testnet coordinators will be available in the Discord channel **#⛓・game-of-chains**.

### Token Distribution and Delegation

Testnet coordinators will operate a validator that maintains the majority of the voting power through phases 1 and 2 in to provide liveness and make sure planned proposals pass. This validator will redistribute its staked tokens at the beginning of phase 3 to simulate a more real-world scenario.

**Tokens will be periodically delegated among validators in the provider chain to trigger validator set updates that will be reflected in the consumer chains.**

## Disclaimers

1. The final number of points awarded to each participant is at the discretion of the testnet jury.
2. The timeline for all phases and rounds may change depending on the outcome of previous activities.
3. Available tasks and points may be adjusted during the course of the testnet program.
4. All evidence submitted for points must be sent through https://interchainsecurity.dev/game-of-chains-2022#evidence-form.

## Timeline

### Phase 1: Two Dummy Chains

- Testnet coordinators will start a provider chain and provide guidance on how to join it.
- Testnet coordinators will submit proposals to create two consumer chains.
- Validators will vote yes on the proposals and run the consumer chain binaries.
- Testnet coordinators will run the relayer between provider and consumer chains.
- **Duration: 5 days**

Phase tasks:

* 🔎 1. Vote on the Sputnik `create-consumer-chain` proposal (1 point)
* 🔎 2. Vote on the Apollo `create-consumer-chain` proposal (1 point)
* 👷 11. Sign on the first block of the Sputnik chain (1 point)
* 👷 12. Sign on the first block of the Apollo chain (1 point)
* **4 points maximum**

#### Round 1: Start the Sputnik and Apollo Consumer Chains

**Nov 7-11**

Sputnik will be the first attempt to start a consumer chain, with the aim of keeping it online for the duration of the testnet program. The binary for this chain will be a stripped-down version of a Cosmos SDK chain with only the essential components needed to function.

Apollo will start shortly after Sputnik, and it will use the same `interchain-security` repo branch. The Apollo chain will be stopped via governance proposal in the following phase.

Testnet coordinators will submit the create chain proposals and distribute the necessary files and data prior to and following the spawn time:

- Guides for joining
- Binary file
- Genesis files
- Peer address
- Faucet address

### Phase 2: Three Planned Chains

- Testnet coordinators will submit two proposals to create additional consumer chains and one proposal to stop one of them.
- Validators will vote yes on proposals and run the consumer chain binaries.
- Testnet coordinators will run relayers between provider and consumer chains.

Phase tasks

* 🔎 26. Vote on the Hero `create-consumer-chain` proposal (1 point)
* 🔎 3. Vote on the Neutron `create-consumer-chain` proposal (1 point)
* 🔎 4. Vote on the Gopher `create-consumer-chain` proposal (1 point)
* ~~🔎 5. Vote on the Stride `create-consumer-chain` proposal (1 point)~~
* 🔎 6. Vote on the Apollo `stop-consumer-chain` proposal (1 point)
* 👷 27. Sign on the first block of the Hero chain (1 point)
* 👷 13. Sign on the first block of the Neutron chain (1 point)
* 👷 14. Sign on the first block of the Gopher chain (1 point)
* ~~👷 15. Sign on the first block of the Stride chain (1 point)~~
* 👷 16. Sign on the last block of the Apollo chain without having been jailed for downtime since the first block (1 point) 
* **8 points maximum**

#### Round 2: Start the Hero Consumer Chain

**Nov 17-21**

Hero chain is a consumer chain testing out a new custom minting module.

Testnet coordinators will submit the create chain proposal and distribute the necessary files and data prior to and following the spawn time:

- Guides for joining
- Binary file
- Genesis file
- Peer addresses
- Faucet address

#### Round 3: Start the Neutron Consumer Chain

**Nov 21-23**

Testnet coordinators will submit the create chain proposal and distribute the necessary files and data prior to and following the spawn time:

- Guides for joining
- Binary file
- Genesis file
- Peer addresses
- Faucet address

#### Round 4: Start the Gopher Consumer Chain

**Nov 21-23**

📢 We are launching the `gopher` chain with the goal of testing `rly` (the `go` relayer). Please do not operate any other relayer (Hermes, etc.) with this chain.

Testnet coordinators will submit the create chain proposal and distribute the necessary files and data prior to and following the spawn time:

- Guides for joining
- Binary file
- Genesis file
- Peer addresses
- Faucet address

#### Round 5: Stop the Apollo Consumer Chain

**Nov 21-23**

Testnet coordinators will submit a proposal to stop the Apollo chain.

### Phase 3: Anyone Can Make a Chain

- Validators will submit proposals and coordinate with each other to start and stop consumer chains.
- Validators will operate relayers.
- Testnet coordinators will submit proposals that may be incorrect or point to malicious binaries.

Phase tasks:

* 🔎 7. Vote no on at least one proposal that contains incorrect metadata (1 point)
* 🔎 8. Vote no on at least one proposal that links to malicious binaries (2 points)
* 🔎 30. Vote **yes** on the `slasher` chain `consumer-addition` proposal (1 point)
* 👷 17. Sign on the last block of the Sputnik chain without having been jailed for downtime since the first block (2 point)
* 👷 18. Create at least one custom consumer chain binary for a proposal that passes (5 points)
* 👷 19. Submit at least one `create-consumer-chain` proposal for a chain that starts (5 points)
* 👷 20. Submit at least one `stop-consumer-chain` proposal that results in the chain stopping at the specified stop time (5 points)
* 👷 21. Run a relayer between a provider and consumer chain that relays at least 500 validator set changes (20 points)
* 👷 28. Assign a key on an existing consumer chain (1 point).
* 👷 29. Assign a key on a new consumer chain (1 point).
* 👷 31. Get unjailed after being slashed by the `slasher` chain (2 points)
* **45 points maximum**

#### Round 6: Proposal Due Diligence

**Nov 29-Dec 2**

Testnet coordinators will submit several proposals to create consumer chains:
- Some proposals may be erroneous.
- Some binaries related to these proposals will be malicious.

It will be up to the validators to review the proposals and reject the bad ones! None of these proposals should result in a consumer chain starting.

#### Round 7: Start Validator Consumer Chains

**Nov 23-Dec 9**

Validators will start any number of additional consumer chains. This will require some engagement and coordination with other participants, besides submitting proposals and (optionally) preparing custom binaries.

Validators will be responsible for running relayers between the provider and consumer chains.

#### Round 8: Stop Validator Consumer Chains

**Nov 23-Dec 9**

Validators will be in charge of stopping consumer chains.

#### Round 9: Stop the Sputnik Consumer Chain

Testnet coordinators will turn off the relayer between the provider and Sputnik chains. The IBC client will expire and reach the timeout period, causing the Sputnik chain to stop.

#### Round 10: Upgrade the Provider Chain to Test New Features

**Nov 30-Dec 9**

A sofware upgrade proposal will be submitted on Nov 30 to upgrade the provider chain on Thursday, Dec 8. The new version will add the following features:

**Key Assignment**

This is one of the most-requested features by validators. Key Assignment allows validators to use different keys on consumer chains than they use on the Cosmos Hub. By sending one transaction, a validator is able to indicate which public key they will be using to validate a consumer chain. Validators can use a different key for each consumer chain.

**Slashing Rate Limiter**

This protects the Cosmos Hub against the worst-case scenario of a malicious consumer chain binary which slashes many validators as part of an attack. The rate limiter will stop an unusually large amount of validation power from being slashed and jailed at once. Most likely, this code will never actually be triggered, but it's good to have it in place. The security benefit that it brings also translates into an operational benefit- higher confidence in safety means less work needs to be expended by validators and core teams on auditing consumer chain upgrade proposals. We will test this code by launching a malicious `slasher` consumer chain which will try to slash all validators. Due to the rate limiting code, only a few validators at most will be slashed and jailed per hour. The validators who are jailed can then unjail themselves to prevent takeover of the chain.

#### Game of Chains Ends

**Dec 9, 2022**

We will review all evidence submitted up until Dec 9.

Please note that the evidence will take some time to review before a final tally is published.

## Points System

To earn points in the Game of Chains testnet program, you can:
- Complete one or more tasks from the [categories listed below](#🔎-Auditor-Tasks), or
- Submit an entry for the [Testnet Awards](#🏅-Testnet-Awards).

### 🔎 Auditor Tasks

#### Review and Vote on Proposals

| # | Points | Task | Evidence |
|---|-----|-----|---|
| 1 | 1  | Vote yes on the Sputnik `create-consumer-chain` proposal | TX hash |
| 2 | 1  | Vote yes on the Apollo `create-consumer-chain` proposal | TX hash |
| 3 | 1  | Vote yes on the Neutron `create-consumer-chain` proposal | TX hash |
| 4 | 1 | Vote yes on the Gopher `create-consumer-chain` proposal | TX hash |
| ~~5~~ | ~~1~~ | ~~Vote yes on the Stride `create-consumer-chain` proposal~~ | ~~TX hash~~ |
| 6 | 1 | Vote yes on the Apollo `stop-consumer-chain` proposal | TX hash |
| 7 | 1 | Vote no on at least one proposal that contains incorrect metadata | TX hash and reason for voting no |
| 8 | 2 | Vote no on at least one proposal that links to malicious binaries | TX hash and reason for voting no |
| 26 | 1 | Vote yes on the Hero `create-consumer-chain` proposal | TX hash |
| 30 | 1 | Vote **yes** on the `slasher` chain `consumer-addition` proposal | TX hash |

#### Validator Sets Monitoring

**‼ 📢 The following task can be completed at any point throughout the testnet program**

| # | Points | Task | Evidence |
|---|-----|-----|---|
| 9 | 50 | Find a consumer chain validator set that has not existed in the provider chain | Log, block height |
| 10 | 50 | Find a validator set update that is received in the wrong order in a consumer chain | Log, block height |

### 👷 Builder Tasks

#### Start and Stop Consumer Chains

| # | Points | Task | Evidence |
|---|-----|-----|---|
| 11 | 1 | Sign the first block after genesis of the Sputnik chain | None required* |
| 12 | 1 | Sign the first block after genesis of the Apollo chain | None required* |
| 13 | 1 | Sign the first block after genesis of the Neutron chain | None required* |
| 14 | 1 | Sign the first block after genesis of the Gopher chain | None required* |
| ~~15~~ | ~~1~~ | ~~Sign the first block after genesis of the Stride chain~~ | ~~None required*~~ |
| 16 | 1 | Sign the last block of the Apollo chain without having been jailed for downtime since the first block | None required* |
| 17 | 2 | Sign the last block of the Sputnik chain without having been jailed for downtime since the first block | None required* |
| 18 | 5 | Create at least one custom consumer chain binary for a proposal that passes   | Source code |
| 19 | 5 | Submit at least one `create-consumer-chain` proposal for a chain that starts  | TX hash |
| 20 | 5 | Submit at least one `stop-consumer-chain` proposal that results in the chain stopping at the specified stop time | TX hash |
| 27 | 1 | Sign the first block after genesis of the Hero chain | None required* |
| 28 | 1 | Assign a key on an existing consumer chain | TX hash |
| 29 | 1 |  Assign a key on a new consumer chain | TX hash |
| 31 | 2 |  Get unjailed after being slashed by the `slasher` chain | TX hash |

* \*For tasks that do not require evidence, testnet coordinators will query the relevant blocks.

#### Run a Relayer

| # | Points | Task | Evidence |
|----|---|----|----|
| 21 | 20 | Run a relayer between a provider and consumer chain that relays at least 500 validator set changes | Consumer chain block heights with validator set updates |

### 🌪 Chaotic Tasks 

**‼ 📢 Chaotic tasks can be completed at any point throughout the testnet program**

#### Validator Misbehaviour

| # | Points | Task | Evidence |
|----|---|----|----|
| 22 | 5 | Get unjailed at least twice after downtime in Sputnik or Apollo | TX hashes |
| 23 | 5 | Double sign in Sputnik or Apollo and create a new validator | Block height for double-signing and TX hash for creating new validator |
| 24 | 150 | Double sign in a consumer chain without getting jailed | Write-up |

#### Relayer Misbehaviour

| # | Points | Task | Evidence |
|----|---|----|----|
| 25 | 150 | Break the protocol through relayer misbehaviour | Write-up that demonstrates behaviour that deviates from [the ICS-028 spec](https://github.com/cosmos/ibc/blob/main/spec/app/ics-028-cross-chain-validation/README.md).   |

### 🏅 Testnet Awards

The testnet jury will decide who is the winner of the following awards:

| Points | Award | Description |
|---|---|---|
| 200 | Best Auditor | Find any unexpected critical issues that were not found through planned tasks |
| 100 | Public Goods Awards (Up to two) | Integrates a block explorer, wallet, dashboard, or creates a novel tool that is useful for testing Interchain Security |
| 50 | Most Helpful Validator | Provides guidance and onboarding support to others, answers questions in Discord |
| 25 | Best Memes | Gets people excited on social media through tweets and memes |

If you would like to provide the jury with more information about your pariticipation in the testnet that should be considered for these awards, feel free to use the evidence submission form. You may submit issue writeups, descriptions for public goods, or any other evidence that can help us make an informed jury decision.

## Rules

The Game of Chains testnet aims to help validators better understand and become familiar with Interchain Security, and at the same time identify potential issues in the underlying code. While participants are encouraged to behave adversarially on the network, breaking the rules outlined below will result in disqualification.

The rules for playing Game of Chains can be changed at any time. Changes will be committed here and announced via Discord.

### Disqualification


The following behaviour will result in participants being disqualified from Game of Chains:

* Violating the Gaia [Code of Conduct](https://github.com/cosmos/gaia/blob/main/CODE_OF_CONDUCT.md).
* Registering an account to simply delegate or transfer all the tokens to a single or small number number of validators.
* Engaging in any prohibited behaviour.

### Prohibited Behaviour

* Any attack against a node that violates the acceptable use policy outlined by that node's cloud service provider. Please familiarize yourself with those policies (such as [Google's](https://cloud.google.com/terms/aup), [Amazon's](https://aws.amazon.com/aup/), or [Digital Ocean's](https://www.digitalocean.com/legal/acceptable-use-policy)).
* Social engineering attacks against other validators. This includes but is not limited to phishing, compromising cloud account credentials, malware, and physical security attacks on data centers.
* Attacking any testnet other than the Game of Chains one.
* Causing long-term harm to a validator setup.
* Exploiting application-level security vulnerabilities in Cosmos and Tendermint code.

## Acknowledgements

A number of people have helped us update and improve this repo. Our sincere thanks to the following contributors:

* [Chris Remus](https://github.com/chris-remus)
* [CryptoCrew Validators](https://github.com/clemensgg)
* [Jacob Gadikian](https://github.com/faddat)
* [valNodeOne](https://github.com/valNodeOne)
* [danb](https://github.com/danbryan)
* [ping](https://github.com/liangping)
* [james.](https://github.com/reversesigh)
