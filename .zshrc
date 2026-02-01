# exports
# clean home
export XDG_DATA_HOME="$HOME/.local/share" # where user-specific data files should be store
export XDG_STATE_HOME="$HOME/.local/state" # where user-specific state files should be stored
export XDG_CONFIG_HOME="$HOME/.config" # where user-specific configuration files should be stored
export XDG_CACHE_HOME="$HOME/.cache" # where user-specific non-essential (cached) data should be stored
export BIN_HOME="$HOME/.local/bin" # where user-specific executable files may be written
export PATH="$PATH:$BIN_HOME"

# shell history
export HISTFILE="$XDG_CACHE_HOME/zsh/history" # make sure the directory exists, otherwise the file will not be created
HISTDIR="${HISTFILE%/*}" # applied string manipulatio to remove the filename from the path
if [ ! -d "$HISTDIR" ]; then
  echo "zsh history directory does not exist, creating it"
  mkdir -p -v "$HISTDIR"
fi

export HISTSIZE=1000
export SAVEHIST=1000

export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"


# editor
if hash nvim 2> /dev/null ; then
    export VISUAL='nvim'
    export MANPAGER='nvim --cmd ":lua vim.g.noplugins=1" +Man!'
elif hash vim 2> /dev/null ; then
    export VISUAL='vim'
    export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
else
    export VISUAL='vi'
fi
export MANWIDTH=80
export EDITOR="$VISUAL"

# language
#export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

export LC_MONETARY=it_IT.UTF-8
export LC_NUMERIC=it_IT.UTF-8
export LC_TIME=it_IT.UTF-8


# functions
function mcd {
    # usage: mcd <dir>
    # create a dir and cd into it
    local newdir='_mcd_command_failed'
    if [ -d "$1" ]; then
        echo "$1 already exists"
        newdir="$1"
    else
        command mkdir -p "$1" && newdir="$1"
    fi
    builtin cd "$newdir"
}

function :qa {
    while tmux next-window 2> /dev/null; do
        tmux kill-window
    done
    tmux kill-window
}

function fsearch {
    # [f]ile [s]earch
    # search a file in the given path or default to current directory
    local dir=${1:-'.'}
    find "$dir" -type f | fzf
}

function psearch {
    # running [p]rocess [s]earch
    ps aux | fzf
}

function in_ssh {
    # return true if you are in ssh
    # return false if you are in your local machine
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        true
    else
        case $(ps -o comm= -p "$PPID") in
            sshd|*/sshd) true;;
            *) false;;
        esac
    fi

    false
}

function extract {
    # Extract most know archives with one command
    if [ -f "$1" ]; then
      case $1 in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.tar.xz) tar xf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar e "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via extract function" ;;
      esac
    else
      echo "'$1' is not a valid file"
    fi
}
function json-format {
    # given a json string, return it formatted
    if hash jq 2> /dev/null; then
        echo "$1" | jq
    else
      echo "jq is not installed"
    fi
}

function xls2csv {
    # given a xls file convert it to csv
    if hash libreoffice 2> /dev/null; then
        libreoffice --headless --convert-to csv "$1"
    elif hash soffice 2> /dev/null; then
        # libreoffice on MacOs is called `soffice`
        soffice --headless --convert-to csv "$1"
    elif hash gnumeric 2> /dev/null; then
        # get the file name without the extension
        file_name="${1%.*}"
        ssconvert "$1" "${file_name}.csv"
    else
      echo "Neither libreoffice and gnumeric are installed"
    fi
}
function csv2xls {
    # given a csv file convert it to xls
    if hash libreoffice 2> /dev/null; then
        libreoffice --headless --convert-to xls "$1"
    elif hash soffice 2> /dev/null; then
        # libreoffice on MacOs is called `soffice`
        soffice --headless --convert-to xls "$1"
    else
      echo "libreoffice is not installed"
    fi
}
function md2pdf {
    # given a markdown file convert it to pdf
    if hash pandoc 2> /dev/null; then
        # get the file name without the extension
        file_name="${1%.*}"
        pandoc "$1" -o "${file_name}.pdf"
    else
      echo "pandoc is not installed"
    fi
}

function img {
    # image viewer
    if hash nsxiv 2> /dev/null; then
        'nsxiv' $1
    else
        'open' $1
    fi
}

function pdf {
    # pdf viewer
    if hash zathura 2> /dev/null; then
        'zathura' $1
    else
        'open' $1
    fi
}

if hash gtree 2> /dev/null ; then
    function cwt {
        # change git worktree
        tree=$(gtree choose) # command found in https://github.com/Klodii/bin
        [ -n "$tree" ] && cd "$tree"
    }
fi


# aliases
alias .f='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias edit="$VISUAL" # provide a command to use on all systems
alias ll='ls -AlFh --color=auto'
alias mv='mv -v'
alias cp='cp -v -i' # verbose and confirm before overwriting something
alias rm='rm -v'
alias diff='diff --color=always'
alias :q='exit'
alias myip='curl -4 https://get.geojs.io/v1/ip'
alias cmyip='curl -4 https://get.geojs.io/v1/ip | cclip' # copy my ip to clipboard

# -a archive mode (preserves permissions, timestamps, symlinks, etc.)
# -v verbose (shows what’s happening)
# --progress → shows progress for large files
# Remember that the trailing / on source_dir/ means “copy contents” not the folder itself
alias rsync='rsync -av --progress'

hash batcat 2> /dev/null && alias bat='batcat' # normalize 'bat', the command is called batcat in Ubuntu
hash bat 2> /dev/null && alias cat='bat'
hash ipython 2> /dev/null && alias python='ipython'

# normalize aliases across Linux, macOS, and Windows.
OPERATNG_SYSTEM=$(uname -s)
if [ $OPERATNG_SYSTEM = 'Darwin' ]; then # it is equal to Darwin it means OS=MacOS
    alias o='open'
    alias fm='o .'

    alias cclip='pbcopy' # copy and paste directly from terminal, pipe the output of a command to the alias
    alias vclip='pbpaste' # to paste the text you just copied, you shall use:

    # libreoffice on MacOs is called `soffice`
    alias libreoffice='soffice'

    # open with a URL will open the default browser
    export BROWSER="open"

    # Use GNU coreutils instead of the default ones
    alias date='gdate'
else
    if grep -q Microsoft /proc/version; then
        # Ubuntu on Windows using the Linux subsystem
        alias o='explorer.exe';
    else
        alias o='xdg-open';
        hash thunar 2> /dev/null && alias fm='thunar'; # arch file manager
        hash nautilus 2> /dev/null && alias fm='nautilus'; # gnome file manager
        # dragon (in $BIN_HOME) opens a small window that enables to drag and
        # drop a file/folder easily
        if hash dragon 2> /dev/null ; then
            function dnd {
                OBJ_PATH="$1"
                [ -d "$OBJ_PATH" ] && OBJ_PATH="$OBJPATH/"

                dragon -x "$OBJ_PATH"*
            }
        fi

        alias cclip='xclip -selection clipboard' # copy and paste directly from terminal, pipe the output of a command to the alias
        alias vclip='xclip -o -selection clipboard' # to paste the text you just copied, you shall use:

        # these aliases are exported because used in tmux-browser script
        hash brave 2> /dev/null && export BROWSER="brave"
        hash brave-browser 2> /dev/null && export BROWSER="brave-browser"
    fi
fi

# lf, file manager, alias
# lfcd is a script that when exiting from lf will cd into
# the last selected directory
LFCD="$XDG_CONFIG_HOME/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
    alias lf='lfcd'
fi

# zsh configuration START
setopt appendhistory      # append history instead of overwriting
setopt inc_append_history # commands are added to the history immediately, otherwise only when shell exits
setopt histignorespace    # don't save commands that start with space
unsetopt beep             # no beep
bindkey -v                # enable vim mode
autoload -Uz compinit && compinit
# keybindings
bindkey -s "^e" "edit .\n" # edit (alias) the current directory
bindkey -s "^r" "source $HOME/.zshrc\n" # refresh zsh configuration
bindkey -s "^b" "cd $BIN_HOME\n" # open users bin directory

# plugins
## syntax highlighting
SYNTAX_PLUGIN_LINUX_PATH='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
SYNTAX_PLUGIN_FEDORA_PATH='/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
SYNTAX_PLUGIN_MAC_PATH='/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source $SYNTAX_PLUGIN_LINUX_PATH > /dev/null 2>&1 || source $SYNTAX_PLUGIN_FEDORA_PATH > /dev/null 2>&1 || source $SYNTAX_PLUGIN_MAC_PATH > /dev/null 2>&1 || echo "zsh syntax highlighting plugin is not installed"
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
# prompt
setopt prompt_subst # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion
autoload -Uz vcs_info # load version control information
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
zstyle ':vcs_info:*' enable git

function precmd_vcs_info { vcs_info }
function set_virtualenv {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="%F{cyan}[`basename \"$VIRTUAL_ENV\"`]%f"
  fi
}

# preexec is a hook, like precmd
function preexec {
    # This function is executed just before a command is executed in the shell.
    # Store the start time of the last command
    _START_TIME=$(date +%s%3N)
}

function calculate_end_time {
    # Store the end time of execution of the previous command and calculate the duration
    if [[ -n "$_START_TIME" ]]; then
        local _END_TIME=$(date +%s%3N)
        local _DURATION=$(( (_END_TIME - _START_TIME) / 1000 )) # in seconds
        _LAST_COMMAND_TIME="(⏳${_DURATION}s)"
    else
        unset _LAST_COMMAND_TIME
    fi
}
function set_prompt {
    if in_ssh; then
        POSITION_LINE='%F{magenta}%n@%m%f: %F{blue}%~%f'
    else
        POSITION_LINE='%F{blue}%~%f'
    fi
    NEW_LINE=$'\n'
    COMMAND_LINE='%(?.%F{green}>.%F{red}!)%f  %# '
    PROMPT='%B${PYTHON_VIRTUALENV} ${POSITION_LINE} %b'\$vcs_info_msg_0_' ${NEW_LINE} ${COMMAND_LINE}'
    # add a character to the right side of the prompt
    # in this way it becomes more easier to identify the prompt row
    RPROMPT='%F{blue}«%D{%H:%M:%S}${_LAST_COMMAND_TIME}%f'

    # When pressend enter without any command we don't wont to show the time
    unset _START_TIME
}

# 'precmd' is a zsh hook that execute, each functions in precmd_functions, before your prompt is displayed
precmd_functions+=( precmd_vcs_info set_virtualenv calculate_end_time set_prompt )
# zsh configuration END

# source the work related configuration
WORK_CONFIGURATION_PATH="$HOME/work/.zshrc"
# using if instead of && to prevent the .zshrc to have a exit status different than 0
if [ -f $WORK_CONFIGURATION_PATH ]; then source $WORK_CONFIGURATION_PATH; fi
