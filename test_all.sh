#!/usr/bin/env bash
DEVICE_ID=0
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test M-30 | tee ~/faster-rcnn-M-30.log
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test M-30-HD | tee ~/faster-rcnn-M-30-HD.log
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test Urban1 | tee ~/faster-rcnn-Urban1.log
