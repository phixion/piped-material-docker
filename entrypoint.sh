#!/bin/bash
set -euo pipefail

npm install -g serve \
serve -l tcp://0.0.0.0:3000
