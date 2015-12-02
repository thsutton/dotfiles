# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/Library/FStar" ]; then
   export FSTAR_HOME="$HOME/Library/FStar"
   export PATH="${FSTAR_HOME}/bin:${PATH}"
fi

# OPAM configuration
if [ -f "$HOME/.opam/opam-init/init.sh" ]; then
    source /Users/thsutton/.opam/opam-init/init.sh > /dev/null 2>&1 || true
fi
