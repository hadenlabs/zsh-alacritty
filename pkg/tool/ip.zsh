#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::ip::validate {
    if [ -z "${VIRUSTOTAL_API_KEY}" ]; then
        message_warning "VIRUSTOTAL_API_KEY is neccesary"
        return 0
    fi
}

function ipaddressreport {
    local ipaddress
    alacritty::ip::validate
    ipaddress="${1}"

    http GET https://www.virustotal.com/vtapi/v2/ip-address/report \
         apikey=="${VIRUSTOTAL_API_KEY}" ip=="${ipaddress}"
}
