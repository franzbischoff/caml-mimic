@echo off

SET dirname=%~p0

cd "%dirname%" || exit /b
cd ../../learn || exit /b

python training.py ../mimicdata/mimic2/train.csv ../mimicdata/mimic2/vocab.csv full conv_attn 200 --filter-size 10 --num-filter-maps 50 --lr 0.0003  --dataset mimic2 --public-model --test-model "%dirname%\model.pth" --gpu

cd "%dirname%"
