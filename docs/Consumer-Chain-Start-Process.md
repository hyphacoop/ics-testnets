# Consumer Chain Start Process

The process we are following to start the consumer chains is as follows:
1. Initialize the consumer chain genesis file
2. Generate a hash for the consumer chain binary and genesis file.
3. Submit a `create-consumer-chain` gov proposal that lists these hashes on the provider chain.
4. After the SpawnTime passes, collect the CCV states in the provider chain.
5. Update the consumer chain genesis file with the CCV states.
6. Run the consumer chain binary.
7. Setup an IBC channel between the provider chain and the consumer chain using the Hermes relayer.

The diagram below illustrates this process.

![Consumer chain start process](../images/consumer-start-process.svg)


## Updating Genesis Files

Modified genesis files will be provided for chains supported in this repo, but you can follow the steps below to modify a genesis file yourself.

1. Collect the CCV states from the provider chain (the query will fail if the SpawnTime has not been reached).
```bash
CONS_CHAIN_ID=consumer # consumer chain id
PROV_NODE_DIR=~/.interchain-security-provider # provider home folder
interchain-security-pd query provider consumer-genesis $CONS_CHAIN_ID --home $PROV_NODE_DIR -o json > ccvconsumer_genesis.json
```

2. Copy the resulting JSON file to your consumer chain and patch the genesis file.
```bash
CONS_NODE_DIR=~/.interchain-security-consumer # consumer home folder
jq -s '.[0].app_state.ccvconsumer = .[1] | .[0]' ${CONS_NODE_DIR}/config/genesis.json ccvconsumer_genesis.json > ${CONS_NODE_DIR}/edited_genesis.json 
mv ${CONS_NODE_DIR}/edited_genesis.json ${CONS_NODE_DIR}/config/genesis.json
rm ccvconsumer_genesis.json
```

The consumer chain binary can now start.