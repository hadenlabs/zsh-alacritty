#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALACRITTY_SRC_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/pkg/linux.zsh
      ;;
    esac
}

if [ "$(alacritty::core::alacritty::exist)" -eq 0 ]; then alacritty::install; fi

alacritty::pkg::main::factory