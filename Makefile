## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test
VENV          = ~/.devops
HAS_PYTHON3    = NO
HAS_VIRTUALENV = NO
PYENV   = $(VENV)/bin/activate
PYTHON        = $(shell which python3)

ifeq ($(shell which python3 >/dev/null 2>&1; echo $$?), 0)
HAS_PYTHON3 = YES
endif

ifeq ($(shell which virtualenv >/dev/null 2>&1; echo $$?), 0)
HAS_VIRTUALENV = YES
endif

ifeq ($(shell which python3 >/dev/null 2>&1; echo $$?), 0)
HAS_PYTHON3 = YES
endif

# ------------------------------------------

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  setup        Create python virtualenv"
	@echo "  install      Install required packages from requirements.txt"
	@echo "  lint         Check file erros"
	@echo "  test         Test app.py"
	@echo "  docker       Run docker script"
	@echo "  all          Run all files"
	@echo "  clean        Remove all intermediate files"
	@echo "  help         Show this help message"

# ------------------------------------------

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	@( \
		virtualenv -p $(PYTHON) $(VENV); \
		. $(VENV)/bin/activate; \
		deactivate;\
	)

install: $(PYENV)
	# This should be run from inside a virtualenv
	@( \
		. $(VENV)/bin/activate; \
		pip install --upgrade pip &&\
			pip install -r requirements.txt; \
		deactivate ;\
	)

test: $(PYENV)
	# Additional, optional, tests could go here
	@( \
		. $(VENV)/bin/activate; \
		python -m pytest -vv --cov=tests/testscase tests/*.py; \
		deactivate ;\
	)

lint: $(PYENV)
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	@hadolint Dockerfile; \
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	@( \
		. $(VENV)/bin/activate; \
		pylint --disable=R,C,W1203 app.py; \
		deactivate ;\
	)

docker: 
	@sh run_docker.sh

upload: 
	@sh upload_docker.sh

run:
	@kubectl apply -f kubernetes-prediction.yaml

all: setup install lint docker test upload

clean: 
	@docker rm -f udacity-prediction

$(VENV):
	@if [ "$(HAS_PYTHON3)" == "NO" ] ; then echo "Python3 was not found! Please check README.md for further instructions" 1>&2; exit 1; fi
	@if [ "$(HAS_VIRTUALENV)" == "NO" ] ; then echo "virtualenv was not found! Please check README.md for further instructions" 1>&2; exit 1; fi
