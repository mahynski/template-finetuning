FROM continuumio/miniconda3:latest
# RUN apt update -y

# Create a user with a given User and Group ID
# https://vsupalov.com/docker-shared-permissions/
ARG UID
ARG GID
RUN addgroup --gid $GID user
RUN adduser --disabled-password --gecos '' --uid $UID --gid $GID user

USER user
COPY conda-env.yml /

ENV PYTHONDONTWRITEBYTECODE=true

# https://huggingface.co/docs/autotrain/en/quickstart
RUN conda env create -f conda-env.yml \
 && conda clean -afy

# Make RUN commands use bash not sh -necessary to make conda work
SHELL ["/bin/bash", "--login", "-c"]

# Initialize conda in bash config files (~/.bashrc) for all future RUNs
RUN conda init bash

# https://huggingface.co/docs/autotrain/en/quickstart
RUN conda activate project-env \
 && pip install autotrain-advanced \
 && conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia \
 && conda install -c "nvidia/label/cuda-12.1.0" cuda-nvcc \
 && conda install xformers -c xformers \
 && python -m nltk.downloader punkt \
#  && pip install flash-attn --no-build-isolation \
 && pip install deepspeed \
 && python -m ipykernel install --user --name=project-env \
 && conda clean -afy

# Install notebook outside of environments
# Run in base conda env so it knows about pip
# autotrain-advanced needs to be installed in the main env for some reason - we don't need the dependencies though
RUN conda run pip install notebook python-dotenv mlflow \
 && conda run pip install autotrain-advanced \ 
 && conda clean -afy