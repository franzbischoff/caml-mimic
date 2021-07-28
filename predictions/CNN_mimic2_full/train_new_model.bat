@echo off

SET dirname=%~p0

cd "%dirname%" || exit /b
cd ../../learn || exit /b

python training.py ../mimicdata/mimic2/train.csv ../mimicdata/mimic2/vocab.csv full cnn_vanilla 100 --filter-size 4 --num-filter-maps 500 --dropout 0.2 --lr 0.003 --dataset mimic2 --patience 10 --criterion prec_at_8 --embed-file ../mimicdata/mimic2/processed_full.embed --gpu

cd "%dirname%"
