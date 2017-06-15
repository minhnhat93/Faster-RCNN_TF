#!/bin/bash
# Usage:
# ./experiments/scripts/faster_rcnn_end2end.sh GPU NET DATASET [options args to {train,test}_net.py]
# DATASET is either pascal_voc or coco.
#
# Example:
# ./experiments/scripts/faster_rcnn_end2end.sh 0 VGG_CNN_M_1024 pascal_voc \
#   --set EXP_DIR foobar RNG_SEED 42 TRAIN.SCALES "[400, 500, 600, 700]"

set -x
set -e

export PYTHONUNBUFFERED="True"

DEV=$1
DEV_ID=$2
NET=$3
DATASET=$4

array=( $@ )
len=${#array[@]}
EXTRA_ARGS=${array[@]:4:$len}
EXTRA_ARGS_SLUG=${EXTRA_ARGS// /_}

case $DATASET in
  M-30)
    TEST_IMDB='gram_M-30'
    ;;
  M-30-HD)
    TEST_IMDB='gram_M-30-HD'
    ;;
  Urban1)
    TEST_IMDB='gram_Urban1'
    ;;
  *)
    echo "No dataset given"
    exit
    ;;
esac

time python3 ./tools/test_net.py --device ${DEV} --device_id ${DEV_ID} \
  --weights models/pascal_voc/VGGnet_fast_rcnn_iter_70000.ckpt \
  --imdb ${TEST_IMDB} \
  --cfg experiments/cfgs/faster_rcnn_end2end.yml \
  --network $NET \
  ${EXTRA_ARGS}
