# Codeturner's dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Files and methods used to setup my  Mac from scratch.

Refer to <https://sourabhbajaj.com/mac-setup> for recipes for getting a mac up and going.

## System Preferences

* View > organize alphabetically
* Internet Accounts
  * icloud - check drive, contacts, calendars, reminders, keychain, findmymac
  * google - check contacts, calendars
* Battery > Battery > 5 mins
* Battery > Power > 30 mins
* Battery > Power > Prevent sleep
* Trackpad > Check all on all tabs
* Keyboard > Keyboard > Key Repeat > Fast (all the way to the right)
* Keyboard > Keyboard > Delay Until Repeat > Short 80%
* Keyboard > Keyboard > Turn keyboard backlight off after 1 min of inactivity
* Keyboard > Keyboard > Use F1, F2 keys...
* Keyboard > Shortcuts > Launchpad > disable dock hiding shortcut
* Keyboard > Shortcuts > Mission Control > disable show desktop as F11
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
* Always show hidden files
  * `defaults write com.apple.finder AppleShowAllFiles True; killall Finder`

### Emoji Text Substitution

Enable slack style text substitution everywhere by installing a plist into your `Keyboard > Text` preferences. Follow the instructions here: <https://github.com/warpling/Macmoji>

### Modifier Keys

If you're using an external non-Apple keyboard, you will likely need to map the modifier keys. Go to `Keyboard > Keyboard > Modifier Keys` and swap the Command and Option keys.

## Enable Home and End Keys

For whatever reason, Macs don't acknowledge the sane use of home and end, which should be to take the cursor to the beginning and end of the line.  Instead, it takes the cursor to the beginning and end of the document.  The heck?

To fix this, let's put a key bindings file in place:

`cp -pr Library/KeyBindings ~/Library`

This will remap the following in most Mac apps including Chrome (some apps do their own key handling):

* Home and End will go to start and end of line
* Shift+Home and Shift+End will select to start and end of line
* Ctrl+Home and Ctrl+End will go to start and end of document
* Ctrl+/ is mapped to noop so that it won't beep at you when using it in other apps

Note that you will need to reboot after creating this file for it to take effect

## Finder

Customize Finder with the following preferences:

* Customize Toolbar - path, view, new folder, trash, share, actions
* General > New Finder show > Home
* Sidebar > check Home -- uncheck Shared
* Advanced > Show extensions

Then, drop other important folder to the Favorites part of the sidebar, such as `src` and `Screenshots`.

## Cleanup Dock Bar

Remove all the default items. I prefer to use alfred to launch applications, so the dock bar will be used only to show running applications.

## Messages

Customize Messages with the following preferences:

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

When installing the following brew formulae, pay extra attention to notices indicating changes that must be made to shell profile scripts. I've handled them in the terminal setup below, but you should know why we need to do it.

* ack - faster grep
* bash-completion - auto complete library; additional ones available
* fzf - fuzzy finder
* gh - github cli
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

### Casks

Install the following brew casks:

* alfred - better than stoplight
  * Preferences > General > Launch at login
  * Preferences > General > Hotkey - cmd+space
* android-platform-tools - dev tool
* android-sdk - dev tool
* discord - messaging app
* github - github desktop app
* hammerspoon - mac automation
* iterm2 - setup later
* key-codes - view code of pressed key
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

### Quick Look Plugins Casks

Using finder, selecting a file and tapping the space bar will bring up the Quick Look preview of the file. This is different than the Finder preview.

Install the following quick look plugins casks:

> Note some of these apps aren't official Apple apps, so you may need to install using the no quarantine option:
> `brew install --cask --no-quarantine CASK_NAME_HERE`

* qlmarkdown - preview markdown in github style
* syntax-highlight - preview source files
* betterzip - preview archives - teases as a paid app but the included quick look is free

> Note that each of these install as apps, so you'll need to launch each app for the first time to activate the plugin.

### Folder Icons

In Finder, the Mac default folders show some awesome icons on them, but everything else is blank. If that bugs you, try out this tool. Warning: this installs a ton of dependencies!

`brew install --cask folderify`

You can use `folderfy` to create transparent masked icons -- see <https://github.com/lgarron/folderify> for more details. Included are some icons I use, so let's apply them now:

```sh
mkdir -p ~/bin
folderify icons/bolt-lightning.png ~/bin
mkdir -p ~/src
folderify icons/code.png ~/src
mkdir -p ~/temp
folderify icons/poo.png ~/temp
mkdir -p ~/Screenshots
folderify icons/crop.png ~/Screenshots
```

Note that if you add these folders to the sidebar, mac only supports its own icons here (or those who have written a Finder Sync Extension).

### Catalina Notes

To get some of these plugins working in Catalina+, you might need to remove the quarantine attribute. Installing using the `--no-quarantine` option in brew should handle this, but if all else fails, you can correct the situation manually.

For example, if a quicklook plugin isn't working, run this to see the attributes:

```sh
xattr -r ~/Library/QuickLook
```

And run this to remove the attributes:

```sh
xattr -d -r com.apple.quarantine ~/Library/QuickLook
```

Then, restart your system, or hopefully `qlmanage -r` will suffice.

## Node

Let's download node and set our default version.

```sh
# install latest
nvm i node
# install lts
nvm i --lts
# set current and default to lts (assuming v16.* is current lts)
nvm use default 16
```

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

Launch a new terminal and it should auto-launch `p10k configure` where you can choose your style. Or, use my preferred configuration by copying [.p10k.zsh](.p10k.zsh) into your home directory.

Edit or create `.zprofile` and add the following:

```sh
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```

Copy the all of the files in this repo's [.oh-my-zsh/custom](.oh-my-zsh/custom) into `$ZSH_CUSTOM`.

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

Now, let's wire it up to the system by editing the `~/.ssh/config`:

```text
UseKeychain yes
AddKeysToAgent yes
IdentityFile ~/.ssh/default-blah-blah-blah.local
```

I mean, duh, don't paste in "default-blah-blah-blah.local" -- it should be your actual file names.

Finally, add the new private key to your agent:

```sh
ssh-add ~/.ssh/default-blah-blah-blah.local
```

### Github Key Access

Let's create another key for this device's access to github:

```sh
vared -p "github username: " -c _GHUSER
ssh-keygen -f ~/.ssh/github-$(date "+%Y%m%d")-${_GHUSER}-$(hostname)
```

Now, let's wire this new key up to the `github.com` host by editing the `~/.ssh/config` and specifying the new key generated:

```text
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/github-blah-blah-blah.local
```

As before, add the new private key to your agent:

```sh
ssh-add ~/.ssh/default-blah-blah-blah.local
```

Next, let's connect to github using your newly generated key.

Login to github.com and navigate to Profile > Settings > SSH and GPG keys. Click new key and paste the contents of your newly generated github public key and save. To quickly get it to your clipboard for pasting, do:

```sh
pbcopy < ~/.ssh/github-blah-blah-blah.local.pub
```

Once done, verify ssh access:

```sh
ssh -T git@github.com
```

### Managing Multiple Github Accounts

If you're like me, you have two Github accounts: one for personal and one for work. How to use both accounts on the same computer automatically?

Simply repeat the steps in the [Github Key Access](#github-key-access) section above, but use an alias for the `Host` entry in the `~/.ssh/config` file.

For example, if I wanted to create a new key for a github account called `batteryshoes`, my config might now look like this:

```text
Host github.com-batteryshoes
  HostName github.com
  IdentityFile ~/.ssh/github-20220101-batteryshoes-mymac.local
```

Once done, verify ssh access:

```sh
ssh -T git@github.com-batteryshoes
```

Then to use this new account in your git commands, simply use the host alias of `github.com-batteryshoes` to clone the repo.

## Git

Let's customize your git install.

### Configure

Set your default git user:

```sh
git config --global user.name "Put Your Name Here"
git config --global user.email "put_your@email_here"
```

And set the default branch:

```sh
git config --global init.defaultBranch main
```

And tell git to automatically prune remote branches on calls `fetch` or `pull`:

```sh
git config --global remote.origin.prune true
```

Next, let's set vscode as our default merge/diff tool:

```sh
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
git config --global diff.tool vscode
git config --global diff.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
```

All these commands will be reflected to your `~/.gitconfig` file.

### Custom Commands

Git has a great plugin where if you have an executable script in your PATH that follows the naming scheme of `git-mycommand`, then you'll be able to run this custom script as the git command: `git mycommand`

Let's add a custom command to cleanup local branches interactively. Copy [bin/git-cleanunmerged](bin/git-cleanunmerged) into the home directory. Note that we made sure the `~/bin` is in the `PATH` env var above.

Then, cuz I'm lazy, I wrote an alias that maps `git bclean` to this script `git cleanunmerged` (see [Custom Aliases](#custom-aliases)).

### Custom Aliases

Copy [.gitconfig.aliases](.gitconfig.aliases) into your home directory. Then, reference this file in your config:

```sh
git config --global include.path ~/.gitconfig.aliases
```

Also, remember to make sure any existing `[alias]` sections out of the global config file at `~/.gitconfig`.

## VS Code

Let's setup `code` for proper use.

### Settings Sync

First, let's load up what we've sync'd before on other installs of code.

Turn on Settings Sync using the `Turn On Settings Sync...` entry in the `Manage` gear menu at the bottom of the Activity Bar.

Select all settings to sync. Then, click `Sign in & Turn on` and sign in with your GitHub or Microsoft account. After making this selection, the browser will open so that you can sign in to your Microsoft or GitHub account. When a Microsoft account is chosen, you can use either personal accounts, such as Outlook accounts, or Azure accounts, and you can also link a GitHub account to a new or existing Microsoft account.

After signing in, Settings Sync will be turned on and continue to synchronize your preferences automatically in the background.

Now, just sit back and wait for your VS Code to update.

### Recommended extensions

If starting from scratch, here's a hit list of popular extensions to install:

* acarreiro.calculate - evaluate selected math expressions in your document
* adammaras.overtype - support insert vs overtype mode
* albert.TabOut - Tab out of quotes, brackets, etc
* alefragnani.project-manager - project manager and switcher
* bierner.color-info - css color lookup
* bradlc.vscode-tailwindcss - Intelligent Tailwind CSS tooling for VS Code
* christian-kohler.path-intellisense - filename autocomplete
* chrmarti.regex - regex previewer
* ckolkman.vscode-postgres - postgresql managemeent tool
* DavidAnson.vscode-markdownlint - markdown linter
* dbaeumer.vscode-eslint - ES linter
* DotJoshJohnson.xml - XML Formatting, XQuery, and XPath Tools
* eamodio.gitlens - git annotation
* EdgardMessias.clipboard-manager - historical clipboard
* esbenp.prettier-vscode - js prettier
* formulahendry.auto-close-tag - auto close html/xml tags
* formulahendry.auto-rename-tag - auto rename paired tags
* GitHub.vscode-pull-request-github - manage github pull requests
* Gruntfuggly.todo-tree - Show TODO, FIXME, etc. comment tags in a tree view
* hex-ci.stylelint-plus - Modern CSS/SCSS/Less linter
* Koihik.vscode-lua-format - lua formatter - see hammerspoon
* mitchdenny.ecdc - text selection encode/decode
* moshfeu.diff-merge - allows left/right merging in diff
* ms-azuretools.vscode-docker - Makes it easy to create, manage, and debug containerized applications
* ms-python.python - python intellisense, linting, debugging, etc
* ms-python.vscode-pylance - python rich language support
* ms-toolsai.jupyter - jupyter notebook support
* ms-toolsai.jupyter-keymap - match key mappings to jupyter notebook
* ms-toolsai.jupyter-renderers - jupyter notebook renderer
* ms-vscode.live-server - hosts a local server in your workspace on which to preview your webpages
* ms-vsliveshare.vsliveshare - real-time code collaboration
* ms-vsliveshare.vsliveshare-audio - real-time code collaboration audio
* ms-vsliveshare.vsliveshare-pack - real-time code collaboration extensions
* nhoizey.gremlins - highlight as warnings unexpected characters
* nrwl.angular-console - nx console
* oderwat.indent-rainbow - indention coloring
* patbenatar.advanced-new-file - create a new file and select a dir anywhere in your workspace
* PKief.material-icon-theme - material design icons
* Prisma.prisma - Adds syntax highlighting, formatting, auto-completion, etc for .prisma files
* searKing.preview-vscode - previewer for markdown, html, etc
* sleistner.vscode-fileutils - tooling to move, create, etc files and dirs
* slevesque.vscode-hexdump - show hex dump of file
* waderyan.gitblame - show git blame of file in status bar
* wmaurer.change-case - change case of selected word
* yzane.markdown-pdf - convert markdown doc to pdf
* yzhang.markdown-all-in-one - markdown tools

> To print the current list of extensions, run the following command: `code --list-extensions`

## Hammerspoon

We installed it. Let's use if for some mac automation.

Either refer to the  [.hammerspoon](.hammerspoon) files from this repo or just copy them over, then modify the `init.lua` file to fit your preferences.

If you find yourself editing lua in vs code, you'll want to use the installed `vscode-lua-format` to auto format the code. But I disagree with the line limit, so customize it by copying [.lua](.lua) from this repo to your home directory and then update vscode settings `vscode-lua-format.configPath` to point to the full path of the `.lua/vscode-lua-format` you moved.

## Docker + Colima

Colima is an alternative to Docker Desktop that's solely available as a command-line utility. Under the hood Colima uses the Lima-VM. Lima launches Linux virtual machines with automatic file sharing and port forwarding (similar to WSL2), and containerd.

To install, you'll need both the docker client and the colima server:

```sh
brew install docker colima
```

Start colima:

```sh
colima start
```

Then, check docker:

```sh
> docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

### Docker Compose v2

For Intel:

```sh
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-darwin-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
```

For M1/ARM:

```sh
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-darwin-aarch64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
```

Check if docker compose works:

```sh
❯ docker compose version
Docker Compose version v2.2.3
```

## Zoom

Use the following settings:

* General
  * Use dual monitors
  * Enter full screen
  * Always show meeting controls
  * Remove Zoom from menu bar
* Audio
  * Automatically join computer audio
  * Mute my mic when joining
* Keyboard Shortcuts
  * Mute/Unmute - ctrl+opt+cmd+A - enable global
