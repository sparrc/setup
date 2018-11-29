#####################
# MAC OSX PACKAGES:
#   see: http://brew.sh
#####################

# Standard brew packages requiring no special options
{% set BREW_PKGS = ("git wget tig coreutils zsh cowsay sl unp
                     ripgrep jq rpl neovim colordiff rbenv tree
                     speedtest_cli shellcheck lolcat pigz pyenv
                     youtube-dl bash-completion")
%}

# These packages will overwrite the default Mac OSX utilities:
{% set BREW_PKGS_DEFAULT_NAMES = "findutils grep rsync less" %}

brew-packages:
  cmd.run:
    - name: brew install {{ BREW_PKGS }}
    - unless: brew list {{ BREW_PKGS }}

# this is for installing GNU core utils on mac, replacing BSD variants
brew-dupes-tap:
  cmd.run:
    - name: brew tap homebrew/dupes
    - unless: brew tap | grep homebrew/dupes

brew-dupes-packages:
  cmd.run:
    - require:
      - cmd: brew-dupes-tap
    - name: brew install {{ BREW_PKGS_DEFAULT_NAMES }} --with-default-names
    - unless: brew list {{ BREW_PKGS_DEFAULT_NAMES }}

