#!/usr/bin/env bash
DEVICE_ID=1
NET_STRUCTURE='yolo'
for DATASET in M-30 M-30-HD Urban1
do
    rm data/GRAM-RTM/annotations_cache/annots.pkl
    ./experiments/scripts/gram_test.sh gpu ${DEVICE_ID} VGGnet_test ${DATASET} --net_structure \
    ${NET_STRUCTURE} | tee ~/${NET_STRUCTURE}-${DATASET}.log
done

