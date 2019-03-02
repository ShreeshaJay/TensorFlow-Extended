# The base image to build the Docker container from
FROM jupyter/datascience-notebook:177037d09156
MAINTAINER Armen Donigian (donigian@gmail.com)

# launchbot-specific labels
LABEL name.launchbot.io="TensorFlow Extended: Model Validation, Transformation, Build, Analysis, and Serving"
LABEL workdir.launchbot.io="/home/jovyan"
LABEL description.launchbot.io="TensorFlow Extended: Model Validation, Transformation, Build, Analysis, and Serving"
LABEL 8888.port.launchbot.io="Start Tutorial"

#COPY . /home/jovyan
USER root
RUN apt-get update && apt-get install -y \
    python-pip \
    python-dev \
    build-essential
RUN chmod -R 777 /home/jovyan

USER jovyan
RUN conda create -n tfx_py27 python=2.7

#Set the working directory
WORKDIR /home/jovyan/

# Add files
COPY data /home/jovyan/data
COPY assets /home/jovyan/assets
COPY notebooks /home/jovyan/notebooks
COPY solutions /home/jovyan/solutions
COPY requirements.txt /home/jovyan/requirements.txt
COPY README.md /home/jovyan/README.md

# Allow user to write to directory
USER root
RUN chown -R $NB_USER /home/jovyan \
    && chmod -R 777 /home/jovyan
USER $NB_USER

USER jovyan
RUN . /opt/conda/bin/activate tfx_py27
RUN pip2 install -r /home/jovyan/requirements.txt  
RUN python2 -m pip install ipykernel
RUN python2 -m ipykernel install --user
# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=* --NotebookApp.token='' --NotebookApp.ip=0.0.0.0 --NotebookApp.disable_check_xsrf=True --NotebookApp.iopub_data_rate_limit=1.0e10



