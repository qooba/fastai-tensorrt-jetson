#!/bin/bash
cp -r /usr/lib/python3.6/dist-packages/tensorrt .
docker build -t qooba/jetson:1.0.60-fastai .
