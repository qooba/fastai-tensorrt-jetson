#!/bin/bash
docker run --gpus all  --name jupyter -d --rm -p 8888:8888 -v $(pwd)/notebooks:/opt/notebooks qooba/fastai:1.0.60-gpu
