#!/usr/bin/env bash
set -eou pipefail

version=$(echo "${1:-}" | tr -d '[:space:]')

if [[ "$version" == "" ]]; then
    echo "Usage:"
    echo "  ./install_go.sh VERSION"
    exit 0
fi

if which go; then
    installed=$(go version | awk '{ print $3 }' | sed s/go//g)
else
    installed=""
fi

if [[ "$installed" == "$version" ]]; then
    echo "Go version $version is already installed."
    exit 0
else
    wget "https://dl.google.com/go/go${version}.darwin-amd64.pkg" -O "/tmp/go.pkg"

    echo "Removing all traces of previous Go version"
    sudo rm -rf "/usr/local/go"
    sudo rm -rf "$GOPATH/bin"
    sudo rm -rf "$GOPATH/pkg"

    open "/tmp/go.pkg"
    echo "Installed successfully, recommended next steps:"
    echo "  Run 'Go: Install/Update tools' in VSCode"
    echo "  Install go tools:"
    echo "    go get -u github.com/golang/dep/cmd/dep"
    echo "    go get honnef.co/go/tools/..."
fi
