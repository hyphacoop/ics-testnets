#!/bin/bash

# run this script needs on a machine with the updated gaiad version (you can use cronjob to time it)

# enter your freshly generated pubkey from the generate_consumer_key.sh script
PUBKEY='{"@type":"/cosmos.crypto.ed25519.PubKey","key":"..."}'

# enter your validator account password on provider
PW="<YOUR-ACCOUNTKEY-PW>"

NODE_NAME=gaiad
NODE_HOME=~/.gaia
KEY_NAME=validator
KEYRING_BACKEND=os
DENOM=uprov
CHAIN_ID=provider
CONSUMER_ID=flash
GAS_PRICES=0.0025uprov
RPC=https://rpc.provider-sentry-01.goc.earthball.xyz:443

echo ${PW} | ${NODE_NAME} --home ${NODE_HOME} tx provider assign-consensus-key \
  ${CONSUMER_ID} \
  ${PUBKEY} \
  --from ${KEY_NAME} \
  --keyring-backend ${KEYRING_BACKEND} \
  --chain-id ${CHAIN_ID} \
  --gas auto \
  --gas-adjustment 1.5 \
  --gas-prices ${GAS_PRICES} \
  --node ${RPC} \
  -y