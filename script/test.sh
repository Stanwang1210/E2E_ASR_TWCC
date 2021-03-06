#!/bin/bash
# run testing process

# $1 : Experiment name
# $2 : Cuda id

CONFIG="dlhlp_test"
DIR="/work/b07u1234/b07701209/model_dir"

echo "Start running testing process of E2E ASR"
CUDA_VISIBLE_DEVICES=$2 python3 main.py --config config/${CONFIG}.yaml \
    --name $1 \
	--test \
    --njobs 8 \
    --seed 0 \
    --ckpdir ${DIR}/ckpt_lm/$1 \
	--outdir ${DIR}/test_result_lm/$1

# Eval
python3 eval.py --file ${DIR}/test_result_lm/$1/$1_dev_output.csv
python3 eval.py --file ${DIR}/test_result_lm/$1/$1_test_output.csv
