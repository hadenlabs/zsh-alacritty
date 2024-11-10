#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export ALACRITTY_PACKAGE_NAME="alacritty"
export ALACRITTY_MESSAGE_BREW="Please install brew or use antibody bundle hadenlabs/zsh-brew"
export ALACRITTY_MESSAGE_NOT_FOUND="this not found installed"

export ALACRITTY_CONF_DIR=${HOME}/.config/alacritty
export ALACRITTY_FILE_SETTINGS="${ALACRITTY_CONF_DIR}"/alacritty.toml
export ALACRITTY_THEMES_DIR=${ALACRITTY_CONF_DIR}/themes
[ -z "${EDITOR}" ] && export EDITOR="vim"