[![CircleCI](https://circleci.com/gh/aminueza/Udacity-Microservice-MachineLearning/tree/master.svg?style=svg)](https://circleci.com/gh/aminueza/Udacity-Microservice-MachineLearning/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it:
```
$ make setup
```
* Install the necessary dependencies:
```
$ make install
```
* Fill and set env variables up:
```
$ sh setup_env.sh
```

### Running `app.py`

There are two ways for running `app.py`: locally, docker and kubernetes.

#### Locally
* Run `app.py`
```
$ python app.py
```
#### Running under docker
* The first way to run prediction under docker is running `run_docker.sh`:
```
$ sh run_docker.sh
```
* The easiest way is running by makefile:
```
$ make docker
```

#### Running under kubernetes

There are two ways to deploy prediction to kubernetes: running `run_kubernetes.sh` script or applying by yaml file using makefile.

* To run prediction app under kubernetes, build a docker image and/or push this image to your dockerhub using `run_kubernetes.sh` script:
```
$ make docker
$ sh run_kubernetes.sh
```

* To run prediction app under kubernetes, build a docker image and/or push this image to your dockerhub using yaml/makefile:
```
$ make docker
$ make kubernetes
```
