
function create-dirs {
    for dir in "$@"
    do
        echo "Creating directory $dir"
        mkdir -p "$dir"
    done
}

function install-packages {
    for pkg in "$@"
    do
        echo "Checking if $pkg is installed"
        if ! brew list "$pkg" --quiet &> /dev/null; then
            echo "...Installing $pkg"
            brew install "$pkg"
        fi
    done
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

function manage-git-repo {
    echo "Checking if git repo $1 is managed"
    if [ ! -d "$2" ]; then
        mkdir -p "$2"
        git clone "$1" "$2/."
    else
        cd "$2"
        git fetch --all --prune
        git pull
        cd -
    fi
}

