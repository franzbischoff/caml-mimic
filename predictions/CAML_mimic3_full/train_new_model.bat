@echo off

SET dirname=%~p0

cd "%dirname%" || exit /b
cd ../../learn || exit /b

python training.py ../mimicdata/mimic3/train_full.csv ../mimicdata/mimic3/vocab.csv full conv_attn 200 --filter-size 10 --num-filter-maps 50 --dropout 0.2 --patience 10 --lr 0.0001 --criterion prec_at_8 --embed-file ../mimicdata/mimic3/processed_full.embed --gpu

cd "%dirname%"
