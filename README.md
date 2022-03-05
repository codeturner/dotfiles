# Codeturner's dotfiles

Files and methods used to setup my  Mac from scratch.

Refer to <https://sourabhbajaj.com/mac-setup/iTerm/zsh.html> for recipes for getting a mac up and going.

## System Preferences

* View > organize alphabetically
* Internet Accounts
  * icloud - check drive, contacts, calendars, reminders, keychain, findmymac
  * google - check contacts, calendars
* Battery > Battery > 5 mins
* Battery > Power > 30 mins
* Battery > Power > Prevent sleep
* Trackpad > Check all on all tabs
* Keyboard > Key Repeat > Fast (all the way to the right)
* Keyboard > Delay Until Repeat > Short 80%
* Keyboard > Shortcuts > Launchpad > disable dock hiding shortcut
* Keyboard > Shortcuts > Spotlight > search shortcut - shift+cmd+space
* Dock > Automatically hide and show the Dock
* Dock > Bluetooth > Hide
* Dock > Battery > Check all
* Dock > AirDrop > Hide
* Dock > Siri > Hide
* Dock > Fast user switching > Show only control center
* Spotlight > Uncheck fonts, images, files
* Spotlight > Privacy > Add src
* Set screenshots
  * `mkdir ~/Screenshots`
  * `defaults write com.apple.screencapture location ${HOME}/Screenshots && killall SystemUIServer`

## Enable Home and End Keys

For whatever reason, Macs don't acknowledge the sane use of home and end, which should be to take the cursor to the beginning and end of the line.  Instead, it takes the cursor to the beginning and end of the document.  The heck?

To fix this, let's put a key bindings file in place:

`cp -pr Library/KeyBindings ~/Library`

This will remap the following in most Mac apps including Chrome (some apps do their own key handling):

* Home and End will go to start and end of line
* Shift+Home and Shift+End will select to start and end of line
* Ctrl+Home and Ctrl+End will go to start and end of document
* Shift+Ctrl+Home and Shift+Ctrl+End will select to start and end of document
* Note that you will need to reboot after creating this file for it to take effect.

## Finder

* Customize Toolbar - path, view, new folder, trash, share, actions
* General > New Finder show > Home
* Sidebar > check Home -- uncheck Shared
* Advanced > Show extensions

## Cleanup Dock Bar

Remove all the default items. I prefer to use alfred to launch applications, so the dock bar will be used only to show running applications.

## Messages

* General > disable play sound effect
* iMessage > enable messages in icloud

## Install Apps

Using the app store, install the following:

* bettersnaptool - app store
  * Setup Preferences as follows:
    * General > start on mac starts
    * Keyboard shortcuts:
      * ctrl+opt+cmd+numkeys = halves and quarters
      * ctrl+opt+cmd left = 2/3 left
      * ctrl+opt+cmd right = 2/3 right
      * ctrl+opt+cmd up = max
      * ctrl+opt+cmd down = restore
* unarchiver
* xcode

## Install Font

Fira Code is a great font for coding. Another repo forked it and added glyphs to the font to make it a great dev font.

Download <https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf> and install.

The brew version is way out of date, so download and install this one directly instead.

This is a ligature and antialiased font, so use it with those settings turned on. See that github repo for details.

## Homebrew

Install the missing package manager for macOS by following the instructions at <https://brew.sh>:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Formulae

When installing the following formulae, pay extra attention to notices indicating changes that must be made to shell profile scripts. I've handled them in the terminal setup below, but you should know why we need to do it.

* ack - faster grep
* bash-completion - auto complete library; additional ones available
* fzf - fuzzy finder
* git - source control
* git-lfs - git large file support
* go - go language
* htop - process viewer better than top
* nvm - node package manager
  * install node
  * install yarn
* python3 - python language
* openssl - ssl tools
* rustup - rust language
* sqlite3 - self-contained sql engine and tools
* telnet - web resource tool
* the_silver_searcher - aka `ag` - faster grep
* tree - recursive directory listing
* virtualenv - python environment management
* wget - web resource tool
* zsh - shell

## Brew casks

Install the following casks:

* alfred - better than stoplight
  * Preferences > General > Launch at login
  * Preferences > General > Hotkey - cmd+space
* android-platform-tools - dev tool
* android-sdk - dev tool
* discord - messaging app
* github - github desktop app
* hammerspoon - mac automation
* iterm2 - setup later
* keystore-explorer - exactly what it says
* postman - API tool
* react-native-debugger - dev tool
* rectangle - alternative to bettersnaptool
* scroll-reverser - trackpad should be like an ipad, mouse should be reverse of that
  * Preferences > App > Start at login
  * Preferences > Scrolling > Enable
  * Preferences > Scrolling > Reverse Vertical
  * Preferences > Scrolling > Reverse Mouse
* sensiblesidebuttons - support mouse side click button
  * Preferences > Enabled
  * Preferences > Trigger on Mouse Down
* slack - messaging app
* visual-studio-code - setup later

## SDKMAN

SDKMAN! is a tool for managing parallel versions of multiple Software Development Kits. We'll use this to manage our JVMs. By default, it installs in your home directory, which is not ideal. Here, we'll install it at `/opt/sdkman`.

Note, this installer requires the destination folder to not exist as it will attempt to create it itself, so be sure you have access to create a folder in `/opt`.

```sh
export SDKMAN_DIR="/opt/sdkman" && curl -s "https://get.sdkman.io" | bash
```

Check out their documentation to find out what you can do with sdkman!

Installing sdkman will edit your .bash_profile and .zshrc scripts to place its installed SDKs into your PATH env.

### Java

Amazon Corretto is a no-cost, multiplatform, production-ready distribution of the Open Java Development Kit (OpenJDK). Corretto comes with long-term support that will include performance enhancements and security fixes. Amazon runs Corretto internally on thousands of production services and Corretto is certified as compatible with the Java SE standard. With Corretto, you can develop and run Java applications on popular operating systems, including Linux, Windows, and macOS.

Install java using sdkman:

```sh
> sdk install java 17.0.2.8.1-amzn

Downloading: java 17.0.2.8.1-amzn

In progress...

##################################################################################################################################### 100.0%

Repackaging Java 17.0.2.8.1-amzn...

Done repackaging...
Cleaning up residual files...

Installing: java 17.0.2.8.1-amzn
Done installing!


Setting java 17.0.2.8.1-amzn as default.
> java --version
openjdk 17.0.2 2022-01-18 LTS
OpenJDK Runtime Environment Corretto-17.0.2.8.1 (build 17.0.2+8-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.2.8.1 (build 17.0.2+8-LTS, mixed mode, sharing)
```

Note here is no need to set JAVA_HOME since sdkman will set it when your shell launches. You'll need to relaunch your shell to see this in action.

> Tip: use the tab auto-complete to see the list of available JDKs: `sdk install java [TAB]`

### Groovy

Install groovy using sdkman:

```sh
> sdk install groovy
> groovy --version
Groovy Version: 4.0.0 JVM: 17.0.2 Vendor: Amazon.com Inc. OS: Mac OS X
```

Note here is no need to set GROOVY_HOME since sdkman will set it when your shell launches. You'll need to relaunch your shell to see this in action.

### Maven

Install maven using sdkman:

```sh
> sdk install maven
> mvn --version
Apache Maven 3.8.4 (9b656c72d54e5bacbed989b64718c159fe39b537)
Maven home: /opt/sdkman/candidates/maven/current
Java version: 17.0.2, vendor: Amazon.com Inc., runtime: /opt/sdkman/candidates/java/17.0.2.8.1-amzn
Default locale: en_US, platform encoding: UTF-8
OS name: "mac os x", version: "12.1", arch: "aarch64", family: "mac"
```

Note here is no need to set MAVEN_HOME or M2_HOME  since sdkman will set it when your shell launches. You'll need to relaunch your shell to see this in action.

## iTerm2 setup

Import settings from repo by selecting Preferences > General > Preferences, then checking Load preferences from a custom folder or URL, and selecting the iterm2 folder in this repository.

### Oh My Zsh

Install oh my zsh:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Then, install the theme plugin `p10k`:

`git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

Edit `.zshrc` and set the theme:

`ZSH_THEME="powerlevel10k/powerlevel10k"`

Launch a new terminal and it should auto-launch `p10k configure` where you can choose your style. Or, use my preferred configuration by copying `.p10k.zsh` into your home directory.

Edit or create `.zprofile` and add the following:

```sh
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```

Copy the all of the files in this repo's `.oh-my-zsh/custom` into `$ZSH_CUSTOM`.

### Bash

This is optional. If you're full into zsh (and why wouldn't you be) then there's no need to do this section.

Copy all .bashrc* files into the home directory.

Create a .bash_profile file and add the following:

```sh
# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
export PATH=$HOME/bin:.:$PATH

# bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && source "/opt/homebrew/etc/profile.d/bash_completion.sh"

# git auto-complete
[[ -s /opt/homebrew/etc/bash_completion.d/git-completion.bash ]] && source /opt/homebrew/etc/bash_completion.d/git-completion.bash

# git prompt
[[ -s /opt/homebrew/etc/bash_completion.d/git-prompt.sh ]] && source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

# ag auto-complete
[[ -s /opt/homebrew/etc/bash_completion.d/ag.bashcomp.sh ]] && source /opt/homebrew/etc/bash_completion.d/ag.bashcomp.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load the shell dotfiles
source ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
```

### sudo

Be sure you either are an admin to your machine or have an explicit entry in the sudoers file.

## ssh keys

First, your mac needs to have a default key by which it can be identified when ssh'ing to general services.

Run the following command:

```sh
ssh-keygen -f ~/.ssh/default-$(date "+%Y%m%d")-${USER}-$(hostname)
```

When prompted to enter and re-enter a passphrase, press enter to leave empty.

The command creates your default identity with its public and private keys. The whole interaction will look similar to the following:

```sh
> ssh-keygen -f ~/.ssh/default-$(date "+%Y%m%d")-${USER}-$(hostname)
Generating public/private rsa key pair.
Created directory '/Users/codeturner/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/codeturner/.ssh/default-20220101-codeturner-m1pro22.local
Your public key has been saved in /Users/codeturner/.ssh/default-20220101-codeturner-m1pro22.local.pub
The key fingerprint is:
SHA256:+8imEAhAJkJoO3jA2CsZEpQgld7MenKSegL2uDIlKEk blah-blah-blah
The key's randomart image is:
+---[RSA 3072]----+
|/Oo.             |
|%+o              |
|==.=             |
|+E+.+            |
|o+oo.   S        |
|*.* o.   .       |
|++o=.   .        |
|=... . ..o       |
|.=.   .oo .      |
+----[SHA256]-----+
```

This will create two files in a folder called .ssh in your home directory with the name you specified in the command line.

Let's repeat the process for access to github:

```sh
ssh-keygen -f ~/.ssh/github-$(date "+%Y%m%d")-${USER}-$(hostname)
```

Now, let's wire them up by editing the `~/.ssh/config`, and specifying the two keys generated:

```text
UseKeychain yes
AddKeysToAgent yes
IdentityFile ~/.ssh/default-blah-blah-blah.local

Host github.com
  HostName github.com
  IdentityFile ~/.ssh/github-blah-blah-blah.local
```

I mean, duh, don't paste in "default-blah-blah-blah.local", it should be your actual file names.

Now, be sure these files are locked down and have rw to you only: `chmod 600 ~/.ssh/*`

### Github

Next, let's connect to github using your newly generated key.

Login to github.com and navigate to Profile > Settings > SSH and GPG keys. Click new key and paste the contents of your newly generated github public key and save. To quickly get it to your clipboard for pasting, do:

```sh
pbcopy < ~/.ssh/github-blah-blah-blah.local.pub
```

Once done, verify ssh access:

```sh
ssh -T git@github.com
```

## Git

Copy `.gitconfig.aliases` into your home directory. Then edit `~/.gitconfig` to reference this file:

```sh
[include]
  path = ~/.gitconfig.aliases
  ```

## VS Code

`code --install-extension Shan.code-settings-sync`

Open the extension, login to github, then wait for settings to update VS Code.

### Recommended extensions

* acarreiro.calculate - evaluate selected math expressions in your document
* adammaras.overtype - support insert vs overtype mode
* alefragnani.project-manager - project manager and switcher
* bierner.color-info - css color lookup
* christian-kohler.path-intellisense - filename autocomplete
* chrmarti.regex - regex previewer
* DavidAnson.vscode-markdownlint - markdown linter
* dbaeumer.vscode-eslint - ES linter
* DotJoshJohnson.xml - XML Formatting, XQuery, and XPath Tools
* eamodio.gitlens - git annotation
* EdgardMessias.clipboard-manager - historical clipboard
* esbenp.prettier-vscode - js prettier
* formulahendry.auto-close-tag - auto close html/xml tags
* formulahendry.auto-rename-tag - auto rename paired tags
* hex-ci.stylelint-plus - Modern CSS/SCSS/Less linter
* mitchdenny.ecdc - text selection encode/decode
* moshfeu.diff-merge - allows left/right merging in diff
* ms-python.python - python intellisense, linting, debugging, etc
* ms-python.vscode-pylance - python rich language support
* ms-toolsai.jupyter - jupyter notebook support
* ms-toolsai.jupyter-keymap - match key mappings to jupyter notebook
* ms-toolsai.jupyter-renderers - jupyter notebook renderer
* nhoizey.gremlins - highlight as warnings unexpected characters
* oderwat.indent-rainbow - indention coloring
* patbenatar.advanced-new-file - create a new file and select a dir anywhere in your workspace
* PKief.material-icon-theme - material design icons
* searKing.preview-vscode - previewer for markdown, html, etc
* Shan.code-settings-sync - vs code settings sync to github
* sleistner.vscode-fileutils - tooling to move, create, etc files and dirs
* slevesque.vscode-hexdump - show hex dump of file
* waderyan.gitblame - show git blame of file in status bar
* wayou.vscode-todo-highlight - highlight TODO: and FIXME: annotations
* wmaurer.change-case - change case of selected word
* yzane.markdown-pdf - convert markdown doc to pdf
* yzhang.markdown-all-in-one - markdown tools
