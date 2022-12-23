# Dotfiles
This repository contains all the configuration files that I use.

## Configuration porting
To install the configuration in your system you have to
 1. create an alias to the command that you are gonna use when you want to execute git commands of this repositor. This is done so you can add, commit, push, pull files that are not in the .git file.

 Add this line to your .zshrc or .bashrc

 ```
 alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
 ```

 and restart the terminal or run `$ source ~/.zhsrc` or `$ source ~/.bashrc` to update the configuration.

 Now you can run `dotfiles status`enywhere in your system, to get the status of the repository.

 2. now you can clone the repository into a *bare* repository in a "dot" (.dotfiles in this example) folder of your $HOME:

 ```
 git clone --bare <git-repo-url> $HOME/.dotfiles
 ```

 3. checkout the actual content from the bare repository to your $HOME:

 ```
 dotfiles checkout
 ```
 The step before might fail with a message like:

 ```
 error: The following untracked working tree files would be overwritten by checkout:
     .bashrc
     .gitignore
 Please move or remove them before you can switch branches.
 Aborting
 ```

 This is because your $HOME folder might already have mose stock configuration files which would be overwritten by Git.
 The solution is simple: back up the files if you care about them, remove them if you don't care.

 Then rerun the checkout if you had problems

4. Set the flag `showUntrackedFiles` to `no`, this is done to hide files we are not explicitly tracking yet.
This is so that when you type `dotfiles status` and other commands later, files you are not interested in tracking will not show up as untracked.

```
dotfiles config --local status.showUntrackedFiles no
```


## To do
To make easier the setup on a new machine, we can make a script that executes all the steps automatically.

With a command like:

```
curl -Lks <url to script> | /bin/bash
```

The script can be something like this:

```
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```
