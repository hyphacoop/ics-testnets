#!/bin/bash

### Configuration ###
# You should only have to modify the values in this block
PRIV_VALIDATOR_KEY_FILE=~/priv_validator_key.json # from provider node
NODE_KEY_FILE=~/node_key.json # from provider node
NODE_HOME=~/.isc-pepper
NODE_MONIKER=peppy
#####################

INTERCHAIN_SECURITY_VERSION=v0.1.4
CHAIN_ID=pepper
GENESIS_URL="https://raw.githubusercontent.com/hyphacoop/ics-testnets/main/private-testnet/ccv-pepper-genesis.json" # must include CCV states
PERSISTENT_PEERS="2bd4797ad1812fc7c90737e9ddef38114bd77229@159.89.126.190:26656"

# Install make
echo "Installing make..."
apt install make -y

# Install go 1.19.2
echo "Installing go..."
rm go1.19.2.linux-amd64.tar.gz
wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install Interchain Security v0.1.4 binaries
echo "Installing interchain-security..."
rm -rf interchain-security
git clone https://github.com/cosmos/interchain-security.git
cd interchain-security
git checkout tags/$INTERCHAIN_SECURITY_VERSION
make install
export PATH=$PATH:$HOME/go/bin

# Initialize home directory
echo "Initializing $NODE_HOME..."
rm -rf $NODE_HOME
interchain-security-cd init $NODE_MONIKER --chain-id $CHAIN_ID --home $NODE_HOME

# Replace keys
echo "Replacing keys and genesis file..."
cp $PRIV_VALIDATOR_KEY_FILE $NODE_HOME/config/priv_validator_key.json
cp $NODE_KEY_FILE $NODE_HOME/config/node_key.json

# Replace genesis file
wget $GENESIS_FILE -O genesis.json
mv genesis.json $NODE_HOME/config/genesis.json

# Set up cosmovisor
echo "Setting up cosmovisor..."
mkdir -p $NODE_HOME/cosmovisor/genesis/bin
cp $(which interchain-security-cd) $NODE_HOME/cosmovisor/genesis/bin

echo "Installing cosmovisor..."
export BINARY=$NODE_HOME/cosmovisor/genesis/bin/interchain-security-cd
export GO111MODULE=on
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0

rm /etc/systemd/system/cv-$NODE_MONIKER.service
touch /etc/systemd/system/cv-$NODE_MONIKER.service

echo "[Unit]"                               >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Description=Cosmovisor service"       >> /etc/systemd/system/cv-$NODE_MONIKER.servicee
echo "After=network-online.target"          >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo ""                                     >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "[Service]"                            >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "User=$USER"                            >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "ExecStart=$HOME/go/bin/cosmovisor start --x-crisis-skip-assert-invariants --home $NODE_HOME --p2p.persistent_peers $PERSISTENT_PEERS" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Restart=always"                       >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "RestartSec=3"                         >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "LimitNOFILE=4096"                     >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_NAME=interchain-security-cd'"      >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_HOME=$NODE_HOME'" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_ALLOW_DOWNLOAD_BINARIES=true'" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_RESTART_AFTER_UPGRADE=true'" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_LOG_BUFFER_SIZE=512'" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo ""                                     >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "[Install]"                            >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "WantedBy=multi-user.target"           >> /etc/systemd/system/cv-$NODE_MONIKER.service

# Start service
echo "Starting cv-$NODE_MONIKER.service..."
systemctl daemon-reload
systemctl start cv-$NODE_MONIKER.service
sudo systemctl restart systemd-journald

# Add go and interchain-security-cd to the path
echo "Setting up paths for go and interchain-security-cd..."
echo "export PATH=$PATH:/usr/local/go/bin:$NODE_HOME/cosmovisor/genesis/current/bin" >> .profile

echo "***********************"
echo "To see the Cosmovisor log enter:"
echo "journalctl -fu cv-$NODE_MONIKER.service"
echo "***********************"
