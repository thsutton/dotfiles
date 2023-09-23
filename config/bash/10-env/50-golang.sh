if which go 2>&1 > /dev/null; then
    pathmunge "$(go env GOPATH)/bin"
fi
