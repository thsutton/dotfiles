#!/bin/sh


[ -r "/usr/local/etc/ca-certificates/cert.pem" ] &&
export REQUESTS_CA_BUNDLE=/usr/local/etc/ca-certificates/cert.pem
