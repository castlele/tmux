#!/bin/bash

OS_TYPE="$OSTYPE"
LINUX_MINT="linux-gnu"
MACOS="darwin"

if [[ $OS_TYPE == $LINUX_MINT* ]]; then
    INSTALLATION_CMD="sudo apt install"
elif [[ $OS_TYPE == $MACOS* ]]; then
    INSTALLATION_CMD="brew install"
fi

if [[ ! $(which go) ]]; then
    echo "Install go first: https://go.dev/doc/install"
    exit -1
fi

git clone https://github.com/cbednarski/hostess
cd hostess
make install

cd ..
rm -rf hostess

$INSTALLATION_CMD timewarrior
$INSTALLATION_CMD tmux
