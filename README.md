# Dotfiles
This repository contains all the configuration files that I use.

## Configuration porting
To install the configuration in your system you have to
 1. In order to distinguish the `.dotfiles` repository from others, we need
 to create an alias that points to our repository.
 Doing so enables us to execute add, commit, push and other git commands for
 this repository, all over the file system.

 Add this line to your `.zshrc` or `.bashrc`

 ```
 alias .files='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
 ```

 Restart the terminal or run `$ source ~/.zhsrc` or `$ source ~/.bashrc` to load
 the new alias.

 2. Clone the repository into a *bare* repository in a "dot"
 (`.dotfiles` in this example) folder of your $HOME:

 ```
 git clone --bare <git-repo-url> $HOME/.dotfiles
 ```

 3. Checkout the actual content from the bare repository to your $HOME:

 ```
 .files checkout
 ```
 The step before might fail with a message like:

 ```
 error: The following untracked working tree files would be overwritten by checkout:
     .bashrc
     .gitignore
 Please move or remove them before you can switch branches.
 Aborting
 ```

 This is because your $HOME folder might already have some stock configuration
 files which would be overwritten by Git.
 The solution is simple: back up the files if you care about them,
 remove them if you don't care.

 Then rerun the checkout if you had problems

4. Set the flag `showUntrackedFiles` to `no`,
this is done to hide files we are not explicitly tracking yet.
This is so that when you type `.files status` and other commands later,
files you are not interested in tracking will not show up as untracked.

```
.files config --local status.showUntrackedFiles no
```

# Installation through script
The installation procces has been automated with the `dotfiles-installation`
script that you can run in the $HOME directory:

```bash
./dotfiles_installation
```

## TODO
Automate even the download of the script, store it somewhere on the web.
Doing so enables you to download the file with `curl` and execue it with a single command:

```bash
curl -Lks <url to script> | /bin/bash
```


## zsh plugins
- plugin that adds syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting

## MacOs
- Terminal used: Alacritty: https://alacritty.org/
- Hotkey daemon: https://github.com/koekeishiya/skhd
- Window manager: https://github.com/koekeishiya/yabai (website were it is
  listed how to install it
  https://flat-pasta-dc7.notion.site/Yabai-8da3b829872d432fac43181b7ff628fc)

