#!/bin/bash
# Build the larry chain.

# Configuration
# You should only have to modify the values in this block
NODE_HOME=~/.larry
NODE_MONIKER=larry
# ***

CHAIN_BINARY='larryd'
CHAIN_ID=larry

# Install go 1.19.2
echo "Installing go..."
rm go1.19.2.linux-amd64.tar.gz
wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install larry binary
echo "Installing larry..."
mkdir -p $HOME/go/bin

# echo "Installing build-essential..."
sudo apt install build-essential -y
rm -rf cosmos-goc-larry
git clone https://github.com/hyphacoop/cosmos-goc-larry.git
cd cosmos-goc-larry
git checkout tags/v0.1.0
make install

export PATH=$PATH:$HOME/go/bin

# Initialize home directory
echo "Initializing $NODE_HOME..."
rm -rf $NODE_HOME
$CHAIN_BINARY init $NODE_MONIKER --chain-id $CHAIN_ID --home $NODE_HOME

# Add go and larryd to the path
echo "Setting up paths for go..."
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.profile
