#!/bin/bash -eu

log() {
  echo "[setup] $*"
}

usage() {
  cat <<EOF
  USAGE

    setup  [options]

  OPTIONS

EOF
}

# Expected repo dir will be in the HOME dir
repodir="${HOME}/symmetrical-fishstick"

# Check if dir exists, if not download/clone the repo
