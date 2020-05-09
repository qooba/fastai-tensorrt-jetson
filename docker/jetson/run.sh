#!/bin/bash

docker run --runtime nvidia --network app_default --name jupyter -d --rm -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v $(pwd)/dockr/jetson/notebooks:/opt/notebooks qooba/fastai:1.0.60-jetson
