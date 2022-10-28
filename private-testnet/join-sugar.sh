#!/bin/bash

# Configuration
# You should only have to modify the values in this block
PRIV_VALIDATOR_KEY_FILE=~/priv_validator_key.json # from provider node
NODE_KEY_FILE=~/node_key.json # from provider node
NODE_HOME=~/.isc-sugar
NODE_MONIKER=sugary
# ***

CONSUMER_BINARY_URL='https://github.com/neutron-org/neutron/raw/feat/interchain-security-with-governance/neutrond'
CONSUMER_BINARY='neutrond'
CHAIN_ID=sugar
GENESIS_URL="https://raw.githubusercontent.com/hyphacoop/ics-testnets/main/private-testnet/ccv-sugar-genesis.json" # must include CCV states
PERSISTENT_PEERS="2bd4797ad1812fc7c90737e9ddef38114bd77229@159.203.29.24:26656"

# Install go 1.19.2
echo "Installing go..."
rm go1.19.2.linux-amd64.tar.gz
wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install Neutron binary
echo "Installing neutron..."
mkdir -p $HOME/go/bin
wget $CONSUMER_BINARY_URL -O $HOME/go/bin/$CONSUMER_BINARY
chmod +x $HOME/go/bin/$CONSUMER_BINARY
export PATH=$PATH:$HOME/go/bin

# Initialize home directory
echo "Initializing $NODE_HOME..."
rm -rf $NODE_HOME
$CONSUMER_BINARY init $NODE_MONIKER --chain-id $CHAIN_ID --home $NODE_HOME

# Replace keys
echo "Replacing keys and genesis file..."
cp $PRIV_VALIDATOR_KEY_FILE $NODE_HOME/config/priv_validator_key.json
cp $NODE_KEY_FILE $NODE_HOME/config/node_key.json

# Replace genesis file
wget $GENESIS_URL -O genesis.json
mv genesis.json $NODE_HOME/config/genesis.json

# Set up cosmovisor
echo "Setting up cosmovisor..."
mkdir -p $NODE_HOME/cosmovisor/genesis/bin
cp $(which $CONSUMER_BINARY) $NODE_HOME/cosmovisor/genesis/bin

echo "Installing cosmovisor..."
export BINARY=$NODE_HOME/cosmovisor/genesis/bin/$CONSUMER_BINARY
export GO111MODULE=on
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0

rm /etc/systemd/system/cv-$NODE_MONIKER.service
touch /etc/systemd/system/cv-$NODE_MONIKER.service

echo "[Unit]"                               >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Description=Cosmovisor service"       >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "After=network-online.target"          >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo ""                                     >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "[Service]"                            >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "User=$USER"                            >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "ExecStart=$HOME/go/bin/cosmovisor start --x-crisis-skip-assert-invariants --home $NODE_HOME --p2p.persistent_peers $PERSISTENT_PEERS" >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Restart=always"                       >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "RestartSec=3"                         >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "LimitNOFILE=4096"                     >> /etc/systemd/system/cv-$NODE_MONIKER.service
echo "Environment='DAEMON_NAME=$CONSUMER_BINARY'"      >> /etc/systemd/system/cv-$NODE_MONIKER.service
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
systemctl restart systemd-journald

# Add go and neutrond to the path
echo "Setting up paths for go and cosmovisor current bin..."
echo "export PATH=$PATH:/usr/local/go/bin:$NODE_HOME/cosmovisor/genesis/current/bin" >> .profile

echo "***********************"
echo "To see the Cosmovisor log enter:"
echo "journalctl -fu cv-$NODE_MONIKER.service"
echo "***********************"
