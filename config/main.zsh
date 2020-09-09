#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALACRITTY_SRC_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/config/linux.zsh
      ;;
    esac
}

alacritty::config::main::factory