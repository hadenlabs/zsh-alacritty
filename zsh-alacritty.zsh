#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install alacritty for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

alacritty_package_name=alacritty

ZSH_ALACRITTY_PATH_ROOT=$(dirname "${0}")

ALACRITTY_OSX_APPLICATION=/Applications/Alacritty.app
ALACRITTY_CONF_DIR=${HOME}/.config/alacritty
ALACRITTY_THEMES_DIR=${ALACRITTY_CONF_DIR}/themes
ALACRITTY_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"

function alacritty::exist {
    if [ -e "${ALACRITTY_OSX_APPLICATION}" ]; then
        echo 1
        return 1
    fi
    echo 0
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
        message_warning "${ALACRITTY_MESSAGE_BREW}"
        return
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
        return 1
    fi
    message_info "=== sorry no themes, use fn: list_themes ==="
}

if [ "$(alacritty::exist)" -eq 0 ]; then alacritty::install; fi
