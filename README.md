## Mac Workstation Instructions:

### Preferences to Set:

    Mission Control    -> Automatically re-arrange    -> Off
    Dock               -> Automatically hide and show -> On
    Dock               -> Minimize windows using...   -> Scale Effect
    Trackpad           -> Tap Click                   -> On
    Sharing            -> Computer Name (and Edit...) -> ...
    Keyboard           -> Key Repeat                  -> Fast
    Keyboard           -> Delay Until Repeat          -> Short
    Control Center     -> Sound                       -> Always Show In Menu Bar

### Prereqs:

1. Generate a new SSH key for github access and add to github (https://github.com/settings/keys)
```
ssh-keygen -t ed25519 -C "email@example.com" -f ~/.ssh/id_ed25519_github -N ""
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
3. Install VS Code extensions. Either press cmd+shift+P and use `ext install`:
```
ext install Go
ext install Python
ext install Black Formatter
ext install Pylance
ext install Remote - SSH
ext install Emoji
ext install Active File In StatusBar
ext install rust-analyzer
```
Or install from the CLI:
```
code --install-extension golang.go
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension perkovec.emoji
code --install-extension roscop.activefileinstatusbar
code --install-extension rust-lang.rust-analyzer
```
4. Import Terminal profile from ~/sparrc.terminal

### GPG Instructions:

1. Install [GPG Suite](https://gpgtools.org/)

2. Import personal GPG key. Download .asc file from 1Password and open with GPG Suite. Set Ownertrust of key to 'Ultimate'

