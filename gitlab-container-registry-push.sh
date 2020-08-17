#!/usr/bin/env bash

docker login gitlab.mintech.kr:5005
docker build -t gitlab.mintech.kr:5005/wangsy/rails_docker2 .
docker push gitlab.mintech.kr:5005/wangsy/rails_docker2