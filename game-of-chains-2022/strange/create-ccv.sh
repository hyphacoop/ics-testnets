#!/bin/bash
gaiad query provider consumer-genesis strange -o json | jq . > ccv.json
curl -s https://raw.githubusercontent.com/hyphacoop/ics-testnets/main/game-of-chains-2022/strange/strange-fresh-genesis.json | jq . > fresh.json
jq -s '.[0].app_state.ccvconsumer = .[1] | .[0]' fresh.json ccv.json > strange-genesis.json
sha256sum strange-genesis.json