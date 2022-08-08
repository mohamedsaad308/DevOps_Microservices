!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=mohamedsaad308/ml-microservice

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy ml-microservice --image=mohamedsaad308/ml-microservice:v1.0.0

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
export POD=$(kubectl get pods -l app=ml-microservice -o custom-columns=:metadata.name | tr -d '\n')
kubectl port-forward $POD 8000:80
