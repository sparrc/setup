include:
  - sls.mac-packages

{% set USER = salt['grains.item']('username')['username'] %}
{% set HOME = "/Users/" + USER %}

#####################
# FILES:
#####################

rc:
  file.managed:
    - name: {{ HOME }}/.rc
    - source: salt://files/rc

# custom jq functions:
jq:
  file.managed:
    - name: {{ HOME }}/.jq
    - source: salt://files/jq

terminal-profile:
  file.managed:
    - name: {{ HOME }}/.sparrc.terminal
    - source: salt://files/sparrc.terminal

bash_profile:
  file.managed:
    - name: {{ HOME }}/.bash_profile
    - source: salt://files/bash_profile

warprc:
  file.prepend:
    - name: {{ HOME }}/.warprc
    - source: salt://files/warprc

config:
  file.directory:
    - name: {{ HOME }}/.config
    - makedirs: true

tigrc:
  file.managed:
    - name: {{ HOME }}/.tigrc
    - source: salt://files/tigrc

gitconfig:
  file.managed:
    - name: {{ HOME }}/.config/git/config
    - source: salt://files/gitconfig
    - require:
      - file: config

gitignore:
  file.managed:
    - makedirs: true
    - name: {{ HOME }}/.config/git/ignore
    - source: salt://files/gitignore
    - require:
      - file: config

sshconfig:
  file.prepend:
    - makedirs: true
    - name: {{ HOME }}/.ssh/config
    - source: salt://files/sshconfig

fonts-directory:
  file.directory:
    - name: {{ HOME }}/Library/Fonts

# font scheme
fonts:
  file.recurse:
    - name: {{ HOME }}/Library/Fonts
    - source: salt://files/fonts
    - require:
      - file: fonts-directory

rubocop:
  file.managed:
    - name: {{ HOME }}/.rubocop.yml
    - source: salt://files/rubocop.yml

#####################
# VIM & PATHOGEN:
#####################

vimrc:
  file.managed:
    - name: {{ HOME }}/.vimrc
    - source: salt://files/vimrc

nvim-config:
  file.symlink:
    - user: {{ USER }}
    - group: admin
    - name: {{ HOME }}/.config/nvim
    - target: {{ HOME }}/.vim
    - require:
      - file: config

nvimrc:
  file.symlink:
    - user: {{ USER }}
    - group: admin
    - name: {{ HOME }}/.config/nvim/init.vim
    - target: {{ HOME }}/.vimrc
    - require:
      - file: nvim-config

pathogen:
  git.latest:
    - name: https://github.com/tpope/vim-pathogen
    - target: {{ HOME }}/.vim

pathogen-bundle-dir:
  file.directory:
    - name: {{ HOME }}/.vim/bundle
    - require:
      - git: pathogen

vim-colors-dir:
  file.directory:
    - name: {{ HOME }}/.vim/colors
    - require:
      - git: pathogen

vim-solarized-color:
  file.managed:
    - name: {{ HOME }}/.vim/colors/Solarized.vim
    - source: salt://files/Solarized.vim
    - require:
      - file: vim-colors-dir

vim-go:
  git.latest:
    - name: https://github.com/fatih/vim-go
    - target: {{ HOME }}/.vim/bundle/vim-go
    - rev: v1.22
    - require:
      - file: pathogen-bundle-dir

supertab:
  git.latest:
    - name: https://github.com/ervandew/supertab
    - target: {{ HOME }}/.vim/bundle/supertab
    - require:
      - file: pathogen-bundle-dir

vim-gitgutter:
  git.latest:
    - name: https://github.com/airblade/vim-gitgutter
    - target: {{ HOME }}/.vim/bundle/vim-gitgutter
    - require:
      - file: pathogen-bundle-dir

vim-better-whitespace:
  git.latest:
    - name: https://github.com/ntpeters/vim-better-whitespace.git
    - target: {{ HOME }}/.vim/bundle/vim-better-whitespace
    - require:
      - file: pathogen-bundle-dir

#####################
# ZSH:
#####################

zshrc:
  file.managed:
    - name: {{ HOME }}/.zshrc
    - source: salt://files/zshrc

#####################
# SUBLIME TEXT:
#####################

{% set SUBLIME_DIR = (HOME + "/Library/Application Support/Sublime Text 3/"
                      "Packages/User") %}

sublime-preferences:
  file.managed:
    - name: {{ SUBLIME_DIR }}/Preferences.sublime-settings
    - source: salt://files/Preferences.sublime-settings

/usr/local/bin/subl:
  file.symlink:
    - user: {{ USER }}
    - group: admin
    - target: "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"

#####################
# VS CODE:
#####################

vscode-user-settings:
  file.managed:
    - name: {{ HOME }}/Library/Application Support/Code/User/settings.json
    - source: salt://files/vscode-settings.json

vscode-custom-keybindings:
  file.managed:
    - name: {{ HOME }}/Library/Application Support/Code/User/keybindings.json
    - source: salt://files/vscode-keybindings.json

#####################
# DIRECTORIES:
#####################

# general repos directory
repositories:
  file.directory:
    - name: {{ HOME }}/ws/repos
    - makedirs: true

# GOPATH
gopath:
  file.directory:
    - name: {{ HOME }}/ws/go
    - makedirs: true

#####################
# GIT REPOS
#####################

wd:
  git.latest:
    - name: git@github.com:mfaerevaag/wd.git
    - target: {{ HOME }}/ws/repos/wd
    - branch: master
    - require:
      - file: repositories

cookbook:
  git.latest:
    - name: git@github.com:sparrc/cookbook.git
    - target: {{ HOME }}/ws/repos/cookbook
    - branch: master
    - require:
      - file: repositories

auto-ecs:
  git.latest:
    - name: git@github.com:sparrc/auto-ecs.git
    - target: {{ HOME }}/ws/repos/auto-ecs
    - branch: master
    - require:
      - file: repositories

s3sync:
  git.latest:
    - name: git@github.com:sparrc/s3sync.git
    - target: {{ HOME }}/.s3sync
    - branch: master

