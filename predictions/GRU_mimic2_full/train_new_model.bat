@echo off

SET dirname=%~p0

cd "%dirname%" || exit /b
cd ../../learn || exit /b

python training.py ../mimicdata/mimic2/train.csv ../mimicdata/mimic2/vocab.csv full rnn 100 --rnn-dim 512 --cell-type gru --lr 0.003 --bidirectional --dataset mimic2 --embed-file ../mimicdata/mimic2/processed_full.embed --gpu

cd "%dirname%"
