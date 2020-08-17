#!/bin/bash

CONFIG="dlhlp_lm"
DIR="/work/b07u1234/b07701209/model_dir"

echo "Start running training process of RNNLM"
CUDA_VISIBLE_DEVICES=$2 python3 main.py --config config/${CONFIG}.yaml \
    --name $1 \
    --njobs 8 \
    --seed 0 \
    --lm \
    --logdir ${DIR}/log/ \
    --ckpdir ${DIR}/ckpt/ \
    --outdir ${DIR}/result/ \
