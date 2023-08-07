#!/bin/bash

# Executa o build da imagem usando o Dockerfile no diretório atual
docker build -t migrations .

# O restante do seu script continua normalmente
aws ecr get-login-password --region sa-east-1 | docker login --username AWS --password-stdin 001440321979.dkr.ecr.sa-east-1.amazonaws.com

docker tag migrations:latest 001440321979.dkr.ecr.sa-east-1.amazonaws.com/migrations:latest

docker push 001440321979.dkr.ecr.sa-east-1.amazonaws.com/migrations:latest
