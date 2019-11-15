## Mac Workstation Instructions:

#### Preferences to set:

    Security & Privacy -> Filevault                   -> On
    Mission Control    -> Automatically re-arrange    -> Off
    Mission Control    -> Dashboard                   -> Off
    Dock               -> Automatically hide and show -> On
    Dock               -> Minimize windows using...   -> Scale Effect
    Trackpad           -> Tap Click                   -> On
    Sharing            -> Computer Name (and Edit...) -> ...

#### PRE-REQs:

1. Generate a new SSH key and add to github: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
1. Clone this repo.
1. Install homebrew http://brew.sh/
1. Get .secrets files from 1password and copy to home directory.
1. Install:

    - 1Password
    - VS Code
    - Sublime Text
    - GPG Suite
    - Kaleidoscope (and ksdiff)

## Instructions:

1. install saltstack [https://repo.saltstack.com/](https://repo.saltstack.com/)

2. make and chown the salt directories:

        sudo mkdir -p /etc/salt /var/cache/salt /var/log/salt /var/run/salt
        sudo chown -R sparrc /etc/salt /var/cache/salt /var/log/salt /var/run/salt

3. run salt state

        make salt

4. change default shell to zsh:

        chsh -s /bin/zsh

6. For VS Code, [install dependencies](https://github.com/Microsoft/vscode-go)
and install extensions & shell command:

first press cmd+shift+P, then:

        ext install Go
        ext install Afterglow theme
        ext install vscode-icons
        ext install Active File Status
        ext install ruby-rubocop
        ext install Project Manager
        ext install Cucumber (gherkin) syntax
        Shell Command: install 'code'

7. sudo NOPASSWD sudo configuration, run `sudo visudo` and then change this line:

        %admin  ALL=(ALL) ALL

    to this:

        %admin  ALL=(ALL) NOPASSWD: ALL

8. Import Terminal profile from ~/.sparrc.terminal


## gpg instructions:

1. Install [GPG Suite](https://gpgtools.org/)

2. Import personal GPG key. Download .asc file from 1Password and open
with GPG Suite. Set Ownertrust of key to 'Ultimate'

