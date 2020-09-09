#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::domain::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
}

function domainreport {
    local url
    alacritty::domain::validate
    url="${1}"
    http GET https://www.virustotal.com/vtapi/v2/domain/report \
         apikey=="${VIRUSTOTAL_API_KEY}" resource=="${url}"
}