#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# editalacritty edit settings for alacritty
function editalacritty {
    if [ -z "${EDITOR}" ]; then
        message_warning "it's necessary the var EDITOR"
        return
    fi
    "${EDITOR}" "${ALACRITTY_FILE_SETTINGS}"
}