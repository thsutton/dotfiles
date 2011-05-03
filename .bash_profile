source "$HOME/.bashrc"

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
pathmunge "/Library/Frameworks/Mapnik.framework/Programs"
export PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH
