#!/bin/bash

# $1 : experiment name
# $2 : cuda id

CONFIG="dlhlp_asr_best3"

DIR="/work/b07u1234/b07701209/model_dir"

echo "Start running training process of E2E ASR"
CUDA_VISIBLE_DEVICES=$2 python3 main.py --config config/${CONFIG}.yaml \
    --name $1 \
    --njobs 16 \
    --seed 0 \
    --logdir ${DIR}/log/ \
    --ckpdir ${DIR}/ckpt/ \
    --outdir ${DIR}/result/ \
    # --load ${DIR}/ckpt/$1/best_ctc_LibriSpeech.pth \
