source "$HOME/.bashrc"

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
pathmunge "/Library/Frameworks/Mapnik.framework/Programs"
export PATH

MAPNIK="/Library/Frameworks/Mapnik.framework/Python"
if [ -d "$MAPNIK" ]; then
    export PYTHONPATH="${MAPNIK}:${PYTHONPATH}"
fi
unset MAPNIK
