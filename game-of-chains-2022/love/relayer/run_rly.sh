#!/bin/bash

providerMnmonic="24 words"
memo="Your relayer information"
chains=("provider" "sputnik" "hero" "neutron" "gopher")
RPC_PROVIDER="https://127.0.0.1:26657"
GRPC_PROVIDER="https://127.0.0.1:29090"
RPC_SPUTNIK="https://127.0.0.1:26657"
GRPC_SPUTNIK="https://127.0.0.1:29090"
RPC_HERO="https://127.0.0.1:26657"
GRPC_HERO="https://127.0.0.1:29090"
RPC_NEUTRON="https://127.0.0.1:26657"
GRPC_NEUTRON="https://127.0.0.1:29090"
RPC_GOPHER="https://127.0.0.1:26657"
GRPC_GOPHER="https://127.0.0.1:29090"

# Install rly binary
git clone https://github.com/cosmos/relayer $HOME/relayer && cd $HOME/relayer
git checkout v2.1.2
make install

rly version 

mkdir -p $HOME/.relayer/config

cd -
cp ./ex_config.yaml $HOME/.relayer/config/config.yaml

# Edit config.yaml
sed -i -e "s@YOUR INFORMATION@$memo@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<rpc-provider>@${RPC_PROVIDER}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<grpc-provider>@${GRPC_PROVIDER}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<rpc-sputnik>@${RPC_SPUTNIK}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<grpc-sputnik>@${GRPC_SPUTNIK}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<rpc-hero>@${RPC_HERO}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<grpc-hero>@${GRPC_HERO}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<rpc-neutron>@${RPC_NEUTRON}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<grpc-neutron>@${GRPC_NEUTRON}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<rpc-gopher>@${RPC_GOPHER}@g" $HOME/.relayer/config/config.yaml
sed -i -e "s@<grpc-gopher>@${GRPC_GOPHER}@g" $HOME/.relayer/config/config.yaml

# Import key
for chain in ${chains[@]}
do
  rly keys restore $chain validator-key "${providerMnmonic}"
done

## Start rly
rly start provider-sputnik provider-hero provider-neutron provider-gopher
