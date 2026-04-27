#!/usr/bin/env sh

ROOT_DIR="$(git rev-parse --show-toplevel)"

ln -s "$ROOT_DIR" "$HOME/.config/nvim-dev"

export NVIM_APPNAME="nvim-dev"
