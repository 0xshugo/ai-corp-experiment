#!/bin/bash
SESSION_NAME="ai-corp"

# Check if session exists
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? == 0 ]; then
  echo "Session $SESSION_NAME already exists. Attaching..."
  tmux attach -t $SESSION_NAME
  exit 0
fi

echo "Creating new session: $SESSION_NAME"

# Window 0: HQ (CEO, COO)
tmux new-session -d -s $SESSION_NAME -n "HQ"
tmux split-window -h -t $SESSION_NAME:0
tmux send-keys -t $SESSION_NAME:0.0 "echo 'Starting CEO Agent...'" C-m
tmux send-keys -t $SESSION_NAME:0.1 "echo 'Starting COO Agent...'" C-m

# Window 1: Dev (PM, Engineers)
tmux new-window -t $SESSION_NAME:1 -n "Dev"
tmux split-window -h -t $SESSION_NAME:1
tmux send-keys -t $SESSION_NAME:1.0 "echo 'Starting PM Agent...'" C-m
tmux send-keys -t $SESSION_NAME:1.1 "echo 'Starting Engineer Agent...'" C-m

# Window 2: Admin (Legal, Knowledge)
tmux new-window -t $SESSION_NAME:2 -n "Admin"
tmux split-window -h -t $SESSION_NAME:2
tmux send-keys -t $SESSION_NAME:2.0 "echo 'Starting Legal Agent...'" C-m
tmux send-keys -t $SESSION_NAME:2.1 "echo 'Starting Knowledge Agent...'" C-m

# Window 3: Marketing (PR)
tmux new-window -t $SESSION_NAME:3 -n "Marketing"
tmux split-window -h -t $SESSION_NAME:3
tmux send-keys -t $SESSION_NAME:3.0 "echo 'Starting PR Agent...'" C-m

# Select HQ window
tmux select-window -t $SESSION_NAME:0

echo "Setup complete. To attach, run: tmux attach -t $SESSION_NAME"
