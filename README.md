## Mac Workstation Instructions:

#### Preferences to set:

    Security & Privacy -> Filevault                   -> On
    Mission Control    -> Automatically re-arrange    -> Off
    Mission Control    -> Dashboard                   -> Off
    Dock               -> Automatically hide and show -> On
    Dock               -> Minimize windows using...   -> Scale Effect
    Trackpad           -> Scroll & zoom               -> Direction: Natural -> Off
    Trackpad           -> Tap Click                   -> On
    Sharing            -> Computer Name (and Edit...) -> ...

#### Suggested apps:

Spotify, VLC, Slack.

#### Brightcove:

LastPass, Handbrake.

Install bento4 in ~/ws/bento/bin/*

#### PRE-REQs:

1. Install Google Drive
1. Install homebrew http://brew.sh/
1. echo "username: sparrc" > ./config/grains
1. Install:

    - 1Password
    - VS Code
    - GPG Suite
    - Kaleidoscope (and ksdiff)
    - VirtualBox
    - Vagrant

1. Tell Terminal to sync it's settings from ~/gd/appsync/sparrc.terminal

## Instructions:

1. install saltstack:

        brew install saltstack

2. make and chown the salt directories:

        sudo mkdir -p /etc/salt /var/cache/salt /var/log/salt /var/run/salt
        sudo chown -R sparrc /etc/salt /var/cache/salt /var/log/salt /var/run/salt

3. run salt state

        salt-call --config-dir=./config state.sls sls.mac-workstation

4. change default shell to zsh:

        chsh -s /bin/zsh

6. generate a new ssh key and add it to github:

        https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

8. install [Sublime Package Control](https://packagecontrol.io/installation)
package and then install these:

        Theme - Afterglow

9. For VS Code, [install dependencies](https://github.com/Microsoft/vscode-go)
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

10. sudo NOPASSWD sudo configuration, run `sudo visudo` and then change this line:

        %admin  ALL=(ALL) ALL

    to this:

        %admin  ALL=(ALL) NOPASSWD: ALL

11. Get .secrets files from 1password and copy to home directory.


## gpg instructions:

1. Install [GPG Suite](https://gpgtools.org/) and gpg-agent (brew install gpg-agent)

2. Import personal GPG key. Download .asc file from 1Password and open
with GPG Suite. Set Ownertrust of key to 'Ultimate'

3. (Brightcove): Do the same as step 3 for the Brightcove key.

