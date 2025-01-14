FROM jupyter/r-notebook

USER root

RUN git clone --branch master https://github.com/JGCRI/hector.git hector

RUN R -e 'library("devtools"); devtools::install("/home/jovyan/hector")'
