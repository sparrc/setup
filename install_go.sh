#!/usr/bin/env bash
set -eou pipefail

version="$1"
installed=$(go version)

if echo "$installed" | grep "$version"; then
    echo "Go version $version is already installed."
    exit 0
else
    wget "https://dl.google.com/go/go${version}.darwin-amd64.pkg" -O /tmp/go.pkg

    echo "Removing all traces of previous Go version"
    sudo rm -rf /usr/local/go
    rm -rf $GOPATH/bin
    rm -rf $GOPATH/pkg

    open "/tmp/go.pkg"
    echo "Installed successfully, recommended steps:"
    echo "  Install glide: go get github.com/Masterminds/glide"
    echo "  Run 'Go: Install/Update tools' in VSCode"
fi

