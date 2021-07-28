#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR" || exit
cd ../../learn || exit

python training.py ../mimicdata/mimic3/train_50.csv ../mimicdata/mimic3/vocab.csv 50 rnn 200 --cell-type gru --rnn-dim 512 --lr 0.003 --embed-file ../mimicdata/mimic3/processed_full.embed
# --gpu
