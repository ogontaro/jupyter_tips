#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "Container start"

if [ ! -f ./data/ethereum-historical-dataset.zip ] ; then
  kaggle datasets download -d prasoonkottarathil/ethereum-historical-dataset -p ./data
  unzip ./data/ethereum-historical-dataset.zip -d ./data
fi

tini -g -- "$@"

echo "Container finished"
