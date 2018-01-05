if which go 2>&1 > /dev/null; then
    export PATH="$PATH:$(go env GOPATH)/bin"
fi
