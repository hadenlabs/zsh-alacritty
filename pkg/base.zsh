#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::sync {
    message_info "Alacritty sync conf for ${ALACRITTY_PACKAGE_NAME}"
    rsync -avzh --progress "${ZSH_ALACRITTY_PATH}/conf/" "${ALACRITTY_CONF_DIR}/"
    message_success "sync for ${ALACRITTY_PACKAGE_NAME}"
}

function alacritty::install {
    message_info "Installing Alacritty"
    brew cask install alacritty
    alacritty::post_install
}