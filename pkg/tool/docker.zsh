#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function alacritty::urlscan::validate {
    if [ -z "${URLSCAN_API_KEY}" ]; then
        message_warning "URLSCAN_API_KEY is neccesary"
        return 0
    fi
}

function alacritty::wpvulndb::validate {
    if [ -z "${WPVULNDB_API_TOKEN}" ]; then
        message_warning "WPVULNDB_API_TOKEN is neccesary"
        return 0
    fi
}

# Takes in $1 the python file to execute with sqlmap
function sqlmap {
    mkdir -p ~/.sqlmap
    docker run --rm -it \
           --volume ~/.sqlmap:/root/.sqlmap --volume "$(pwd)":/data --volume /tmp:/tmp \
           booyaabes/kali-linux-full sqlmap "${@}"
}

# urlscan
function urlscan {
    alacritty::urlscan::validate
    mkdir -p ~/.urlscan
    docker run --rm -i \
           -v ~/.urlscan:/root/.urlscan heywoodlh/urlscan-py:latest "${@}" --api "${URLSCAN_API_KEY}"
}

function nmap {
    docker run --rm -i weshigbee/nmap "${@}"
}

function wpscan {
    alacritty::wpvulndb::validate
    docker run --rm -i wpscanteam/wpscan --url "${@}" --api-token "${WPVULNDB_API_TOKEN}"
}
