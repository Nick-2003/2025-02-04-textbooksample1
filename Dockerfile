FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8 # Use image to act as baseline 

COPY conda-linux-64.lock /tmp/conda-linux-64.lock # Access a file to container at build time 

RUN mamba update --quiet --file /tmp/conda-linux-64.lock # mamba update to add the packages specified in conda-linux-64.lock to the base conda environment in the container
# RUN mamba clean --all -y -f # Try cleaning up; failing due to issue with environment 
RUN fix-permissions "${CONDA_DIR}" # Fixing permissions of the directories where we installed things
RUN fix-permissions "/home/${NB_USER}"