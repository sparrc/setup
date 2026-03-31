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
    ARCH=$(uname -m)
    wget "https://dl.google.com/go/go${version}.darwin-$ARCH.pkg" -O "/tmp/go.pkg"

    if [[ -z "${GOPATH:-}" ]]; then
        echo "ERROR: GOPATH is not set. Please set GOPATH before running this script."
        exit 1
    fi

    echo "Removing all traces of previous Go version"
    sudo rm -rf "/usr/local/go"
    sudo rm -rf "$GOPATH/bin"
    sudo rm -rf "$GOPATH/pkg"

    open "/tmp/go.pkg"
    echo "Installed successfully, recommended next steps:"
    echo "  Run 'Go: Install/Update tools' in VSCode"
    echo "  Install go tools:"
    echo "    go install honnef.co/go/tools/cmd/staticcheck@latest"
fi
