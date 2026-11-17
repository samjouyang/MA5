ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:stable
FROM $BASE_CONTAINER
LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get update && apt-get -y install aria2 nmap traceroute

# 3) install packages using notebook user
USER jovyan

RUN pip install --no-cache-dir geopandas babypandas==0.1.5

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
