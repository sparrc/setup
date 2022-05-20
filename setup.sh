#!/bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")
source "$dir/functions.sh"

manage-dirs "$HOME/ws/repos" "$HOME/ws/go" "$HOME/Library/Fonts"
rsync -a "./files/fonts/" "$HOME/Library/Fonts/"
install-packages git

install-packages shfmt wget tig coreutils zsh cowsay sl unp ripgrep jq rpl neovim \
    colordiff rbenv tree speedtest-cli shellcheck lolcat pigz pyenv youtube-dl \
    bash-completion findutils grep rsync less xz gnu-sed sd fd &

manage-file "./files/rc" "$HOME/.rc" &
manage-file "./files/jq" "$HOME/.jq" &
manage-file "./files/sparrc.terminal" "$HOME/sparrc.terminal" &
manage-file "./files/bash_profile" "$HOME/.bash_profile" &
manage-file "./files/tigrc" "$HOME/.tigrc" &
manage-file "./files/gitconfig" "$HOME/.config/git/config" &
manage-file "./files/gitignore" "$HOME/.config/git/ignore" &
manage-file "./files/vimrc" "$HOME/.vimrc" &
manage-file "./files/zshrc" "$HOME/.zshrc" &
manage-file "./files/vscode-settings.json" "$HOME/Library/Application Support/Code/User/settings.json" &
manage-file "./files/vscode-keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json" &
manage-file "./files/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" &
manage-git-repo "git@github.com:mfaerevaag/wd.git" "$HOME/ws/repos/wd-zsh" &
manage-git-repo "git@github.com:troyxmccall/wd.git" "$HOME/ws/repos/wd-bash" &
manage-git-repo "git@github.com:sparrc/cookbook.git" "$HOME/ws/repos/cookbook" &
manage-git-repo "git@github.com:sparrc/auto-ecs.git" "$HOME/ws/repos/auto-ecs" &
manage-git-repo "git@github.com:sparrc/dockerfiles.git" "$HOME/ws/repos/dockerfiles" &
manage-git-repo "git@github.com:sparrc/s3sync.git" "$HOME/.s3sync" &
manage-git-repo "https://github.com/tpope/vim-pathogen" "$HOME/.vim" &

wait

manage-symlink "$HOME/.bashrc" "$HOME/.bash_profile"
manage-dirs "$HOME/.vim/bundle" "$HOME/.vim/colors"
manage-file "./files/Solarized.vim" "$HOME/.vim/colors/Solarized.vim"
manage-symlink "$HOME/.config/nvim" "$HOME/.vim"
manage-symlink "$HOME/.config/nvim/init.vim" "$HOME/.vimrc"
manage-git-repo "https://github.com/fatih/vim-go" "$HOME/.vim/bundle/vim-go" &
manage-git-repo "https://github.com/ervandew/supertab" "$HOME/.vim/bundle/supertab" &
manage-git-repo "https://github.com/airblade/vim-gitgutter" "$HOME/.vim/bundle/vim-gitgutter" &
manage-git-repo "https://github.com/ntpeters/vim-better-whitespace.git" "$HOME/.vim/bundle/vim-better-whitespace" &

wait
