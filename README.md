## Mac Workstation Instructions:

### Preferences to Set:

    Security & Privacy -> Filevault                   -> On
    Mission Control    -> Automatically re-arrange    -> Off
    Dock               -> Automatically hide and show -> On
    Dock               -> Minimize windows using...   -> Scale Effect
    Trackpad           -> Tap Click                   -> On
    Sharing            -> Computer Name (and Edit...) -> ...
    Keyboard           -> Key Repeat                  -> Fast
    Keyboard           -> Delay Until Repeat          -> Short

### Prereqs:

1. Generate a new SSH key for github access and add to github (https://github.com/settings/keys)
```
ssh-keygen -t ecdsa -C "email@example.com" -f ~/.ssh/id_ecdsa_github -N ""
```
2. Clone this repo.
3. Install homebrew http://brew.sh/
4. Get .secrets files from 1password and copy to home directory.
5. Install:

    - 1Password
    - VS Code
    - Sublime Text
    - GPG Suite

### Instructions:

1. Run `make`
2. change default shell to zsh (no longer necessary on macOS):
```
chsh -s /bin/zsh
```
3. For VS Code, [install dependencies](https://github.com/Microsoft/vscode-go) and install extensions & shell command. First press cmd+shift+P, then:
```
ext install Go
ext install Afterglow theme
ext install vscode-icons
ext install Active File Status
ext install Project Manager
Shell Command: install 'code'
```
4. Import Terminal profile from ~/sparrc.terminal

### GPG Instructions:

1. Install [GPG Suite](https://gpgtools.org/)

2. Import personal GPG key. Download .asc file from 1Password and open with GPG Suite. Set Ownertrust of key to 'Ultimate'

