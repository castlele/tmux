#!/bin/bash

BASE=$1

cd $BASE

SELECTED=$(find . -type d -maxdepth $2 -not -path '*/\.*' -print | fzf --margin 10% --bind 'q:abort')

if [[ -z "$SELECTED" ]]; then
    exit 0
fi

tmux new-window -c "$BASE/$SELECTED"
