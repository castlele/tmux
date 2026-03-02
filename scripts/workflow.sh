#!/bin/bash

WORKFLOWS=(
    "WORK"
    "PROJECT"
    "VIM"
    "WASTE"
    "STOP"
)

SELECTED=$(printf "%s\n" "${WORKFLOWS[@]}" | fzf --margin 10% --color="bw" --bind 'q:abort')

if [[ -z "$SELECTED" ]]; then
    echo "No workflow selected!"
    exit 0
fi

tmux set -g status-interval 5

if [[ "$SELECTED" == "STOP" ]]; then
    timew stop
    tmux set -g status-right ""
else
    timew start "$SELECTED"
    tmux set -g status-right "#[reverse]#[noreverse] $SELECTED #(timew | awk '/^ *Total/ {print \$NF}') #[reverse]#[noreverse]"
fi
