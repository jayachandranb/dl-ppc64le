#!/usr/bin/env bash

jupyter notebook --allow-root "$@" &! \
python -m tensorboard --logdir=$TB_LOG_DIR --port=7777 --nopurge_orphaned_data --reload_interval=30
