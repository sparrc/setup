#####################
# MAC OSX PACKAGES:
#   see: http://brew.sh
#####################

# Standard brew packages requiring no special options
{% set BREW_PKGS = ("git wget tig coreutils zsh cowsay sl unp
                     ripgrep jq rpl neovim colordiff rbenv tree
                     speedtest_cli shellcheck lolcat pigz pyenv
                     youtube-dl bash-completion findutils grep
                     rsync less")
%}

brew-packages:
  cmd.run:
    - name: brew install {{ BREW_PKGS }}
    - unless: brew list {{ BREW_PKGS }}

