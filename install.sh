#!/bin/bash

set -eo pipefail

log() {
    printf "$(date -Iseconds)::$1\n"
}

fatal() {
    log "ERROR::$1"
    exit 1
}

machineconfig() {
    git --git-dir="$HOME/$DOTFILES_INSTALL_PATH/" --work-tree="$HOME" $@
}

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(cd "$SCRIPT_DIR" && pwd)

# shellcheck source=conf.env
source "$SCRIPT_DIR/conf.env"

if [ -f "./local.env" ]; then
    # shellcheck source=/dev/null
    source "$SCRIPT_DIR/local.env"
fi

log "Cloning dotfiles repository"
git clone --bare "$DOTFILES_REPO" "$HOME/$DOTFILES_INSTALL_PATH"

log "Checking out files"
machineconfig checkout "$DOTFILES_BRANCH"

log "Hiding untracked files"
machineconfig config --local status.showUntrackedFiles no

log "Finished installing dotfiles"

log "Cloning toolbelt repository"
git clone "$TOOLBELT_REPO" "$HOME/$TOOLBELT_INSTALL_PATH"

log "Checking out files"
pushd "$TOOLBELT_INSTALL_PATH" > /dev/null
git checkout "$TOOLBELT_BRANCH"
popd >/dev/null

log "Finished installing toolbelt"
