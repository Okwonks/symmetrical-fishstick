#!/bin/bash -eu

log() {
  ehco "[brew] $*"
}

log "Checking for homebrew..."
if ! command -v brew &>/dev/null; then
  log "Installing brew..."
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi
log "brew installed"

log "Updating/upgrading brew.."
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Installing GNU coreutils, findutils, gnu-sed and awk to replace the versions
# which come with macOS because they are outdated
gnubinaries=(coreutils findutils gawk gnu-sed)
log "Installing latest GNU binaries"
for gnubinary in "${gnubinaries[@]}"; do
  if brew list --formula | grep -q "^$gnubinary\$"; then
    log "$gnubinary is already installed. Skipping..."
  else
    log "Installing $gnubinary..."
    brew install "$gnubinary"
  fi
done

log "Installing new version of bash and bash-completion..."
brew install bash
brew install bash-completion@2
# Add brew installed bash to /etc/shells
if ! grep -F -q "$(brew --prefix)/bin/bash" /etc/shells; then
  echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells;
fi

# Install some useful binaries
binaries=(bat fzf htop jq nvm ripgrep shellcheck tree wget)
for binary in "${binaries[@]}"; do
  if brew list --formula | grep -q "^$binary\$"; then
    log "$binary is already installed. Skipping..."
  else
    log "Installing $binary..."
    brew install "$binary"
  fi
done

log "Done."
