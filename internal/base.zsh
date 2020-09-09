#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::internal::rsync::install {
    if ! type -p brew > /dev/null; then
        message_warning "${ALACRITTY_MESSAGE_BREW}"
        return
    fi
    message_info "Installing rsync for ${ALACRITTY_PACKAGE_NAME}"
    brew install rsync
    message_success "Installed rsync ${ALACRITTY_PACKAGE_NAME}"
}
