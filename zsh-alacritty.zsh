#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines functions alacritty for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

ZSH_ALACRITTY_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_ALACRITTY_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALACRITTY_PATH}"/core/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALACRITTY_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALACRITTY_PATH}"/pkg/main.zsh
