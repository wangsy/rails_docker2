#!/usr/bin/env bash

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 133785371213.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t rails_docker2 .
docker tag rails_docker2:latest 133785371213.dkr.ecr.ap-northeast-2.amazonaws.com/rails_docker2:latest
docker push 133785371213.dkr.ecr.ap-northeast-2.amazonaws.com/rails_docker2:latest