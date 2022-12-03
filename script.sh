#!/bin/bash

echo "Criando as imagens ...";


docker build --network host -t dayvisonfavacho/projeto-backend:1.0 backend/.
docker build -network host -t dayvisonfavacho/projeto-database:1.0 database/.

echo "Push das imagens para o dockerhub"

docker push dayvisonfavacho/projeto-backend:1.0
docker push dayvisonfavacho/projeto-database:1.0

echo "Criando serviços no cluster kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml