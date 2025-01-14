FROM ghcr.io/msd-live/jupyter/r-notebook:latest

USER root

RUN git clone --branch master https://github.com/JGCRI/hector.git hector

RUN R -e 'library("devtools"); devtools::install("/home/jovyan/hector")'
