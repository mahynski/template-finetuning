#!/bin/bash
source /opt/conda/etc/profile.d/conda.sh;

conda activate project-env;

# First we need to export the HF_TOKEN from a local .env file
absolute_path="$(dirname "$(realpath "$0")")/.env";
export $(grep -v '^#' $absolute_path | xargs);

# Then we can run the autotrain app
autotrain app --host 127.0.0.1 --port 1235;