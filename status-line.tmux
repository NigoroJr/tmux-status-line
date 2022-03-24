#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$CURRENT_DIR/scripts"

TMUX_VERSION="$( tmux -V | awk '{ print $2 }' | egrep -o '[0-9.]+' )"

DEFAULT='#[bg=default]'
CURRENT_WINDOW='#[bg=cyan]'
LAST_WINDOW='#[bg=cyan]'
ZOOMED_WINDOW='#[bg=magenta]'
# Text to show
WINDOW_ID="#{?window_last_flag,${LAST_WINDOW},${DEFAULT}}#I${DEFAULT}"
COLON="#{?window_zoomed_flag,${ZOOMED_WINDOW},${DEFAULT}}:${DEFAULT}"

FMT="${WINDOW_ID}${COLON}#( $SCRIPT_DIR/get_name.bash #I)"
CURRENT_FMT="${WINDOW_ID}${COLON}${CURRENT_WINDOW}#( $SCRIPT_DIR/get_name.bash #I)${DEFAULT}"

tmux setw -g window-status-format "$FMT"
tmux setw -g window-status-current-format "$CURRENT_FMT"

# Status bar
tmux set -g status-left-length 40
# Show clock
tmux set -g status-interval 1
tmux set -g status-right "[${DEFAULT}%Y.%m.%d (%a) %H:%M:%S${DEFAULT}]"
