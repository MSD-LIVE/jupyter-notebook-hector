# Use the MSD-LIVE official Jupyter R notebook image as the base
FROM ghcr.io/msd-live/jupyter/r-notebook:latest AS build-image

# Switch to the root user to allow installation of system-wide software
USER root

# Clone the Hector repository from GitHub into the container
RUN git clone --branch main https://github.com/JGCRI/hector.git /home/jovyan/hector 

# Install the Hector R package using devtools inside the container
RUN R -e 'library("devtools"); devtools::install("/home/jovyan/hector")'

# Switch back to the non-root 'jovyan' user for better security
USER jovyan

# Copy your tutorial Jupyter notebook into the container
COPY hector_tutorial.ipynb /home/jovyan/

# Set the working directory to the jovyan home directory
WORKDIR /home/jovyan/

COPY notebooks /home/jovyan/notebooks
