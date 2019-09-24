#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$CURRENT_DIR/scripts"

FMT="#I:#( $SCRIPT_DIR/get_name.bash #I )#{?window_flags,#{window_flags}, }"
TMUX_VERSION="$( tmux -V | awk '{ print $2 }' | egrep -o '[0-9.]+' )"

tmux setw -g window-status-format "$FMT"
tmux setw -g window-status-current-format "$FMT"

# Status bar
tmux set -g status-left-length 40
# Show clock
tmux set -g status-interval 1
tmux set -g status-right "[#[fg=red,bold]%H:%M:%S #[fg=black,bold]%m/%d/%Y (%a)#[fg=black]]"
# Change color for current window
if (( $TMUX_VERSION < 2.9 )); then
    tmux set -g window-status-current-bg cyan
else
    tmux set -g window-status-current-style bg=cyan
fi
