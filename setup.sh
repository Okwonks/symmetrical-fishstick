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
if [ ! -f "$repodir" ]; then
  log "Dotfiles dir not found.  Cloning..."
  git clone https://github.com/Okwonks/symmetrical-fishstick.git "${HOME}"
fi

configFiles=(vimrc zshrc)
for file in "${configFiles[@]}"; do
  log "Creating symlink to .$file in home..."
  ln -sf "$repodir/.$file" "${HOME}/.file"
done

pushd "$repodir" >/dev/null

log "Running brew installations..."
./brew.sh

log "Setup complete :¬)"
popd >/dev/null
