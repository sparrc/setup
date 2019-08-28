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

#### PRE-REQs:

1. Clone this repo.
1. Install homebrew http://brew.sh/
1. echo "username: $(whoami)" > ./config/grains
1. Get .secrets files from 1password and copy to home directory.
1. Generate a new SSH key and add to github: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
1. Install:

    - 1Password
    - VS Code
    - GPG Suite
    - Kaleidoscope (and ksdiff)


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

5. install [Sublime Package Control](https://packagecontrol.io/installation)
package and then install these:

        Theme - Afterglow

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

1. Install [GPG Suite](https://gpgtools.org/) and gpg-agent (brew install gpg-agent)

2. Import personal GPG key. Download .asc file from 1Password and open
with GPG Suite. Set Ownertrust of key to 'Ultimate'

