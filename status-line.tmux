#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$CURRENT_DIR/scripts"

FMT="#I:#( $SCRIPT_DIR/get_name.bash #I )#{?window_flags,#{window_flags}, }"

tmux setw -g window-status-format "$FMT"
tmux setw -g window-status-current-format "$FMT"
