#!/bin/bash

docker pull nvidia/cuda:10.0-cudnn7-runtime-centos7
docker docker build --network=host -t nvidia/cuda:10.0-cudnn7-runtime-centos7-python3 .
