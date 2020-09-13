function manage-dirs {
    for dir in "$@"
    do
        echo "Checking if directory $dir is managed"
        if [ ! -d "$dir" ]; then
            echo "...Creating directory $dir"
            mkdir -p "$dir"
        fi
    done
}

function install-pkg {
    if which "$1" &>/dev/null; then
        return
    fi
    if ! brew list "$1" --quiet &> /dev/null; then
        echo "...Installing $1"
        brew install "$1"
    fi
}

function install-packages {
    for pkg in "$@"
    do
        echo "Checking if $pkg is installed"
        install-pkg "$pkg" &
    done
    wait;
}

function manage-file {
    echo "Checking if file $2 is managed"
    mkdir -p "$(dirname "$2")"
    if [ ! -f "$2" ]; then
        echo "...Creating $2"
        cp "$1" "$2"
        return
    fi
    if ! diff --unified "$2" "$1"; then
        cp "$1" "$2"
    fi
}

function manage-symlink {
    echo "Checking if symlink $1 -> $2 is managed"
    mkdir -p "$(dirname "$2")"
    if [ ! -f "$2" ] && [ ! -d "$2" ]; then
        echo "...Creating symlink $1 -> $2"
        ln -s "$2" "$1"
    fi
}

function manage-git-repo {
    echo "Checking if git repo $1 ($2) is managed"
    if [ ! -d "$2" ]; then
        mkdir -p "$2"
        git clone "$1" "$2/." --quiet
        cd "$2"
        echo "...Cloned git repo $1 ($2), sha=$(git rev-parse HEAD)"
        cd - &>/dev/null
    else
        cd "$2"
        git fetch --all --prune --quiet
        startSHA=$(git rev-parse HEAD)
        git pull --quiet
        endSHA=$(git rev-parse HEAD)
        if [ "$startSHA" != "$endSHA" ]; then
            echo "...Updated git repo $1 ($2) $startSHA -> $endSHA"
        fi
        cd - &>/dev/null
    fi
}

