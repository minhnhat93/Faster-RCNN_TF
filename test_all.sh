#!/usr/bin/env bash
DEVICE_ID=0
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test M-30
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test M-30-HD
CUDA_VISIBLE_DEVICE=${DEVICE_ID} ./experiments/scripts/gram_test.sh gpu 0 VGGnet_test Urban1
