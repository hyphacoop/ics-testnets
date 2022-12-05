#!/bin/bash

# run this script after initializing the consumer chain / after you ran the provided install script

flashd init --home ~/TMP
PUBKEY=$(flashd --home ~/TMP tendermint show-validator)
cp ~/TMP/config/priv_validator_key.json ~/.flash/config
rm -r ~/TMP
echo "new key generated at $HOME/.flash/config/priv_validator_key.json"
echo "pubkey:"
echo "*****************************************"
echo $PUBKEY
echo "*****************************************"