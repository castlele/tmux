#!/bin/bash

SESSION="MAIN"

SESSION_EXISTS=$(tmux list-sessions | grep $SESSION)

if [[ "$SESSION_EXISTS" = "" ]]; then
    tmux new-session -d -s $SESSION
fi

tmux attach-session -t $SESSION
