#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::sync {
    message_info "Alacritty sync conf for ${ALACRITTY_PACKAGE_NAME}"
    rsync -avzh --progress "${ZSH_ALACRITTY_SRC_PATH}/conf/" "${ALACRITTY_CONF_DIR}/"
    message_success "sync for ${ALACRITTY_PACKAGE_NAME}"
}

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
