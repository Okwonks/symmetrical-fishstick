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
gnubinaries=(coreutils diffutils findutils gawk gnu-sed)
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
binaries=(bat fzf htop jq neovim nvm ripgrep shellcheck tree wget)
for binary in "${binaries[@]}"; do
  if brew list --formula | grep -q "^$binary\$"; then
    log "$binary is already installed. Skipping..."
  else
    log "Installing $binary..."
    brew install "$binary"
  fi
done

# List of applications to install
apps=(docker google-chrome google-cloud-sdk iterm2 neovim spotify visual-studio-code)
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    log "$app is already installed. Skipping..."
  else
    log "Installing $app"
    brew install --cask "$app"
  fi
done

# Redo update and clean up again for safe measure
brew update
brew upgrade
brew upgrade --cask
brew cleanup

log "Done."
