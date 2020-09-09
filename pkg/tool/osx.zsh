#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# docker::install - install docker
function docker::install {
    if ! type -p brew > /dev/null; then
        message_warning "${FUNCTIONS_MESSAGE_BREW}"
        return
    fi
    message_info "Install docker"
    brew cask install docker
    message_success "Installed docker"
}

if ! type -p docker > /dev/null; then docker::install; fi