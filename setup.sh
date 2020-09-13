#!/bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")
source "$dir/functions.sh"

create-dirs "$HOME/ws/repos" "$HOME/ws/go"

install-packages git wget tig coreutils zsh cowsay sl &
install-packages unp ripgrep jq rpl neovim colordiff &
install-packages rbenv tree speedtest_cli shellcheck &
install-packages lolcat pigz pyenv youtube-dl bash-completion &
install-packages findutils grep rsync less xz gnu-sed &

manage-file "./files/rc" "$HOME/.rc" &
manage-file "./files/jq" "$HOME/.jq" &
manage-file "./files/sparrc.terminal" "$HOME/.sparrc.terminal" &
manage-file "./files/bash_profile" "$HOME/.bash_profile" &
manage-file "./files/tigrc" "$HOME/.tigrc" &
manage-file "./files/gitconfig" "$HOME/.config/git/config" &
manage-file "./files/gitignore" "$HOME/.config/git/ignore" &
manage-file "./files/vimrc" "$HOME/.vimrc" &
manage-file "./files/zshrc" "$HOME/.zshrc" &
manage-file "./files/vscode-settings.json" "$HOME/Library/Application Support/Code/User/settings.json" &
manage-file "./files/vscode-keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json" &
manage-file "./files/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" &

wait;

manage-git-repo "git@github.com:mfaerevaag/wd.git" "$HOME/ws/repos/wd-zsh" &
manage-git-repo "git@github.com:troyxmccall/wd.git" "$HOME/ws/repos/wd-bash" &
manage-git-repo "git@github.com:sparrc/cookbook.git" "$HOME/ws/repos/cookbook" &
manage-git-repo "git@github.com:sparrc/auto-ecs.git" "$HOME/ws/repos/auto-ecs" &
manage-git-repo "git@github.com:sparrc/s3sync.git" "$HOME/.s3sync" &

wait;
