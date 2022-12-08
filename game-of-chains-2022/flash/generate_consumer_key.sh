#!/bin/bash

# run this script after initializing the consumer chain / after you ran the provided install script

flashd init --home $HOME/TMP flash
PUBKEY=$(flashd --home $HOME/TMP tendermint show-validator)
cp $HOME/TMP/config/priv_validator_key.json $HOME/.flash/config
rm -r $HOME/TMP
echo "new key generated at $HOME/.flash/config/priv_validator_key.json"
echo "pubkey:"
echo "*****************************************"
echo $PUBKEY
echo "*****************************************"