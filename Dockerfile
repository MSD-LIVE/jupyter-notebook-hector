# Use the MSD-LIVE official Jupyter R notebook image as the base
FROM ghcr.io/msd-live/jupyter/r-notebook:latest AS build-image

# Switch to the root user to allow installation of system-wide software
USER root

# Clone the Hector repository from GitHub into the container
RUN git clone --branch main https://github.com/JGCRI/hector.git /home/jovyan/hector 

# Install the Hector R package using devtools inside the container
RUN R -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
RUN R -e 'library("devtools"); devtools::install("/home/jovyan/hector")'

# DO NOT switch back to the non-root 'jovyan' user or else the notebook won't be able
# to switch to the correct user
# USER jovyan

# Set the working directory to the jovyan home directory
WORKDIR /home/jovyan/

COPY notebooks /home/jovyan/notebooks
