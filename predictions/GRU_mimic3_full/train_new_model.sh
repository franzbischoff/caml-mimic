#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR" || exit
cd ../../learn || exit

python training.py ../mimicdata/mimic3/train_full.csv ../mimicdata/mimic3/vocab.csv full rnn 100 --rnn-dim 512 --cell-type gru --lr 0.003 --bidirectional --patience 10 --criterion prec_at_8 --embed-file ../mimicdata/mimic3/processed_full.embed
# --gpu
