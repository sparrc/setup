{% set USER = salt['grains.item']('username')['username'] %}
{% set HOME = "/Users/" + USER %}

#####################
# FILES:
#####################

bashrc:
  file.symlink:
    - name: {{ HOME }}/.bashrc
    - target: {{ HOME }}/.bash_profile
    - require:
      - file: bash_profile

warprc:
  file.prepend:
    - name: {{ HOME }}/.warprc
    - source: salt://files/warprc

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
#####################
# VIM & PATHOGEN:
#####################

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

