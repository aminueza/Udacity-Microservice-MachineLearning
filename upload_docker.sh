#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=udacity-prediction
dockertag=v1.0

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

#fill out setup_env.sh
source .env.sh #change it for setup_env.sh

#Autenticating
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin

#tagging image
docker tag $dockerpath:latest $DOCKER_USER/$dockerpath:$dockertag

# Step 3:
# Push image to a docker repository
docker push $DOCKER_USER/$dockerpath:$dockertag
