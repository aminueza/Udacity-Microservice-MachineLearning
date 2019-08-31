#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=aminueza/udacity-prediction:v0.1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-prediction --port=80 --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $(kubectl get pods -o=name | grep udacity-prediction | sed "s/^.\{4\}//") 8000:80
