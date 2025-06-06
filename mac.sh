#!/bin/sh

# Based on the thoughtbot laptop script!

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\\n" "$text" >> "$zshrc"
    else
      printf "\\n%s\\n" "$text" >> "$zshrc"
    fi
  fi
}

# Install miniconda for python env management
conda --version 2> /dev/null || (
  mkdir -p ~/miniconda3 &&
  curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh &&
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 &&
  rm ~/miniconda3/miniconda.sh &&
  source ~/miniconda3/bin/activate &&
  conda init --all)

conda update conda
conda config --add create_default_packages ipykernel

# Install Homebrew
brew --version 2> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Determine Homebrew prefix
arch="$(uname -m)"
if [ "$arch" = "arm64" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

append_to_zshrc "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\""
source ~/.zshrc

brew install git

brew install pyenv
append_to_zshrc 'export PYENV_ROOT="$HOME/.pyenv"'
append_to_zshrc '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' 1
append_to_zshrc 'eval "$(pyenv init - zsh)"' 1

source ~/.zshrc
pyenv install -s 3.13
pyenv global 3.13

# Install pipx for global python cli apps
brew install pipx
pipx ensurepath --quiet

pipx install poetry
pipx install pre-commit
pipx install ruff
