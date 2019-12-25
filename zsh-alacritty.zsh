#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install alacritty for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

ZSH_ALACRITTY_PATH_ROOT=$(dirname "${0}":A)

alacritty_package_name=alacritty

ALACRITTY_OSX_APPLICATION=/Applications/Alacritty.app
ALACRITTY_CONF_DIR=${HOME}/.config/alacritty
ALACRITTY_THEMES_DIR=${ALACRITTY_CONF_DIR}/themes

function alacritty::exist {
    if [ -e "${ALACRITTY_OSX_APPLICATION}" ]; then return 1; fi
    return 0
}

function alacritty::sync {
    message_info "Alacritty sync conf for ${alacritty_package_name}"
    rsync -avzh --progress "${ZSH_ALACRITTY_PATH_ROOT}/conf/" "${ALACRITTY_CONF_DIR}/"
    message_success "sync for ${alacritty_package_name}"
}

function alacritty::post_install {
    alacritty::sync
}

function rsync::install {
    if ! type -p brew > /dev/null; then
        message_error "it's neccesary brew, add: luismayta/zsh-brew"
    fi
    message_info "Installing rsync for ${alacritty_package_name}"
    brew install rsync
    message_success "Installed rsync ${alacritty_package_name}"
}

if ! type -p rsync > /dev/null; then rync::install; fi

function alacritty::install {
    message_info "Installing Alacritty"
    brew cask install alacritty
    alacritty::post_install
}

function alacritty::list_themes {
    if [ -e "${ALACRITTY_THEMES_DIR}" ]; then
        message_info "=== your available themes ==="
        message_info "-----------------------------"
        ls -1 "${ALACRITTY_THEMES_DIR}"/*.yaml|sed -r 's/(.*)\/(.*).yaml/    \2/g'
    else
        message_info "=== sorry no themes, use fn: fetch_themes ==="
    fi
}

if [ ! "$alacritty::exist" ]; then alacritty::install; fi
