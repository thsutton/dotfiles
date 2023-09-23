#!/bin/bash

if [ -r "/usr/local/opt/nvm/nvm.sh" -a -d "$HOME/.nvm" ] ; then
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
fi
