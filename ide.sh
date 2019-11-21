#!/bin/sh

tmux new-session -s $1 -d
#split screen in have horizontally
tmux split-window -h -p 20 
tmux split-window -v
tmux send-keys -t 0 "vim" C-m
tmux a -t $1 

