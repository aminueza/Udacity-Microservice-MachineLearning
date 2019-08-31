#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=aminueza/udacity-prediction:v0.1

# Step 2:  
# Authenticate & tag
# Docker image is tagged on docker build
echo "Docker ID and Image: $dockerpath"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin

# Step 3:
# Push image to a docker repository
docker push $dockerpath
