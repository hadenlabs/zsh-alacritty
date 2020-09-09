#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::core::alacritty::exist {
    if [ -e "${ALACRITTY_APPLICATION}" ]; then
        echo 1
        return 1
    fi
    echo 0
}
