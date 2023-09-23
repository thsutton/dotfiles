#!/bin/bash

if [ "$(uname)" = "Darwin" ]; then
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
fi
[ -d "/usr/local/opt/python@3.7/bin" ] && export PATH="$PATH:/usr/local/opt/python@3.7/bin"
[ -d "/usr/local/opt/python@3.8/bin" ] && export PATH="$PATH:/usr/local/opt/python@3.8/bin"
