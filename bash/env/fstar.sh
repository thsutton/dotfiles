if [ -d "$HOME/Library/FStar" ]; then
   export FSTAR_HOME="$HOME/Library/FStar"
   pathmunge "$FSTAR_HOME/bin"
fi
