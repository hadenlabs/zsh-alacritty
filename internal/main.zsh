#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALACRITTY_SRC_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALACRITTY_SRC_PATH}"/internal/linux.zsh
      ;;
    esac
}

if ! type -p rsync > /dev/null; then alacritty::internal::rsync::install; fi

alacritty::internal::main::factory