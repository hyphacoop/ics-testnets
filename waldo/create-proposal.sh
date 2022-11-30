#!/bin/bash
export ACCOUNT="cosmos1xqnf6w60t3shcn5sey75a634w48aky3f4scf5r"
gaiad tx gov submit-proposal consumer-addition waldo-proposal.json \
--from=$ACCOUNT \
--keyring-backend file \
--chain-id=provider \
--gas auto


gaiad tx gov submit-proposal consumer-removal waldo-proposal-stop.json \
--from=$ACCOUNT \
--keyring-backend file \
--chain-id=provider \
--gas auto
