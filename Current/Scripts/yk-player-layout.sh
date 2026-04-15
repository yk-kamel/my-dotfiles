#!/bin/bash

SESSION="music"
ARTWORK_DIR="/tmp/mpd_mpris"
# Find the most recent artwork file in that directory
ARTWORK_PATH=$(ls -t $ARTWORK_DIR/artwork_* | head -1)

# Create a new session and hide the status bar for cleanliness
tmux new-session -d -s $SESSION
tmux set-option -g status off

# Pane 0: ncmpcpp
tmux send-keys -t $SESSION "ncmpcpp" C-m

# Split for the bottom row (30% height)
tmux split-window -v -p 30

# Pane 1: cava
tmux send-keys -t $SESSION "cava" C-m

# Split the bottom pane horizontally for the artwork (roughly a square)
tmux split-window -h -p 25

# Pane 2: Display the image
# We use --transfer-mode=file for performance and -P to place it in the pane
tmux send-keys -t $SESSION:0.2 "kitten icat --align left $ARTWORK_PATH" C-m

# Focus back on ncmpcpp
tmux select-pane -t 0
tmux attach-session -t $SESSION
