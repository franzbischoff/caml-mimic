#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR" || exit
cd ../../learn || exit

python training.py ../mimicdata/mimic3/train_full.csv ../mimicdata/mimic3/vocab.csv full cnn_vanilla 100 --filter-size 4 --num-filter-maps 500 --dropout 0.2 --lr 0.003 --embed-file ../mimicdata/mimic3/processed_full.embed --patience 10 --criterion prec_at_8
# --gpu
