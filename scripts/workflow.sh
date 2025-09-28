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

    hostess rm studio.youtube.com
    hostess rm www.youtube.com
    hostess rm www.reddit.com
    hostess rm www.x.com
    hostess rm www.linkedin.com
    hostess rm www.privatemail.com
    hostess rm discord.com
    hostess rm status.discord.com
    hostess rm cdn.discordapp.com
    hostess rm latency.discord.media
    hostess rm gateway.discord.gg
else
    timew start "$SELECTED"
    tmux set -g status-right "#[reverse]#[noreverse] $SELECTED #(timew | awk '/^ *Total/ {print \$NF}') #[reverse]#[noreverse]"

    if [[ "$SELECTED" == "WASTE" ]]; then
        hostess rm studio.youtube.com
        hostess rm www.youtube.com
        hostess rm www.reddit.com
        hostess rm www.x.com
        hostess rm www.linkedin.com
        hostess rm www.privatemail.com
        hostess rm discord.com
        hostess rm status.discord.com
        hostess rm cdn.discordapp.com
        hostess rm latency.discord.media
        hostess rm gateway.discord.gg
    else
        hostess add studio.youtube.com 127.0.0.1
        hostess add www.youtube.com 127.0.0.1
        hostess add www.reddit.com 127.0.0.1
        hostess add www.x.com 127.0.0.1
        hostess add www.linkedin.com 127.0.0.1
        hostess add www.privatemail.com 127.0.0.1
        hostess add discord.com 127.0.0.1
        hostess add status.discord.com 127.0.0.1
        hostess add cdn.discordapp.com 127.0.0.1
        hostess add latency.discord.media 127.0.0.1
        hostess add gateway.discord.gg 127.0.0.1
    fi
fi
