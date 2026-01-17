#!/bin/bash

SESSION="MAIN"

SESSION_EXISTS=$(tmux list-sessions | grep $SESSION)

if [[ "$SESSION_EXISTS" = "" ]]; then
    tmux new-session -d -s $SESSION

    tmux rename-window -t 1 'NOTES'
    tmux send-keys -t 'NOTES' 'notes' C-m
fi

tmux attach-session -t $SESSION
