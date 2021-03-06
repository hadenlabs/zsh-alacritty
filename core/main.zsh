#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::core::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALACRITTY_PATH}"/core/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_PATH}"/core/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_PATH}"/core/linux.zsh
      ;;
    esac
}

alacritty::core::main::factory