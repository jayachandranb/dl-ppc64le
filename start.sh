#!/usr/bin/env bash

jupyter notebook --allow-root "$@" &! \
python -m tensorboard --logdir=/root/pod_storage/tf_logs --port=7777 --nopurge_orphaned_data --reload_interval=30
