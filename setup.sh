#!/bin/bash

OS_TYPE="$OSTYPE"
LINUX_MINT="linux-gnu"
MACOS="darwin"

if [[ $OS_TYPE == $LINUX_MINT* ]]; then
    INSTALLATION_CMD="sudo apt install"
elif [[ $OS_TYPE == $MACOS* ]]; then
    INSTALLATION_CMD="brew install"
fi

$INSTALLATION_CMD tmux
