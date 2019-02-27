#!/bin/bash

if [ -x "$(command -v docker)" ]; then
	# set name of Tensorflow Serving docker image & download it
	# for more info see https://github.com/tensorflow/serving/tree/master/tensorflow_serving/tools/docker
	DOCKER_IMAGE_NAME=tensorflow/serving
	echo Download TF Serving docker image: $DOCKER_IMAGE_NAME
	docker pull $DOCKER_IMAGE_NAME
	
	# location of local model to be used by Tensorflow Serving
	# should contain a folder named with a UTC timestamp  
	#MODEL_BASE_PATH="/Users/arm/code/tfx/tensorflow-extended-model-build-analysis-and-serving/tf/run_0/serving_model_dir/export/nyc-taxi"
    MODEL_BASE_PATH=$(pwd)/tf/run_0/serving_model_dir/export/nyc-taxi

	# ensure trained model is available
	if ! [ -d "$MODEL_BASE_PATH" ]; then
	  echo "ERROR: Exported model directory $MODEL_BASE_PATH not found"
	  exit 1
	fi

	echo Starting the Model Server to serve from: $MODEL_BASE_PATH

	# location of model dir within container
	CONTAINER_MODEL_BASE_PATH=/models/nyc-taxi

	# local port where to send inference requests
	HOST_PORT=9000

	# container listening port for inference requests
	CONTAINER_PORT=8500

	echo Model directory: $MODEL_BASE_PATH

	docker run -it \
	  -p 127.0.0.1:$HOST_PORT:$CONTAINER_PORT \
	  -v $MODEL_BASE_PATH:$CONTAINER_MODEL_BASE_PATH \
	  -e MODEL_NAME=nyc-taxi\
	  --rm $DOCKER_IMAGE_NAME
else
    echo "Please Install docker"
    exit 1
fi
