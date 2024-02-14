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
export HISTSIZE=1000
export SAVEHIST=1000

export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"


# editor
if hash nvim 2> /dev/null ; then
    export VISUAL='nvim'
    export MANPAGER='nvim --cmd ":lua vim.g.noplugins=1" +Man!'
else
    export VISUAL='vi'
    export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
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

# aliases
alias .f='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias edit="$VISUAL" # provide a command to use on all systems
alias ll='ls -AlFh --color=auto'
alias mv='mv -v'
alias cp='cp -v -i' # verbose and confirm before overwriting something
alias rm='rm -v'
alias diff='diff --color=always'
alias extract='tar -xf' # extract (-x) the archive file (-f) specified. It must be .tar.gz

alias myip='curl -4 https://get.geojs.io/v1/ip'
alias cclip='xclip -selection clipboard' # copy and paste directly from terminal, pipe the output of a command to the alias
alias vclip='xclip -o -selection clipboard' # to paste the text you just copied, you shall use:
alias cmyip='curl -4 https://get.geojs.io/v1/ip | cclip' # copy my ip to clipboard
alias :q='exit'

hash batcat 2> /dev/null && alias bat='batcat' # normalize 'bat', the command is called batcat in Ubuntu

# normalize aliases and cross Linux, macOS, and Windows.
OPERATNG_SYSTEM=$(uname -s)
if [ $OPERATNG_SYSTEM = 'Darwin' ]; then # it is equal to Darwin it means OS=MacOS
    alias fm='open .'
    export BROWSER="/Applications/Brave Browser.app/"
else
    if grep -q Microsoft /proc/version; then
        # Ubuntu on Windows using the Linux subsystem
        alias open='explorer.exe';
    else
        alias open='xdg-open';
        hash thunar 2> /dev/null && alias fm='thunar'; # arch file manager
        export BROWSER="brave-browser"
    fi
fi

# zsh configuration START
setopt appendhistory      # append history instead of overwriting
setopt inc_append_history # commands are added to the history immediately, otherwise only when shell exits
setopt histignorespace    # don't save commands that start with space
unsetopt beep             # no beep
bindkey -v                # enable vim mode
autoload -Uz compinit && compinit
bindkey -s "^e" "edit .\n" # edit (alias) the current directory
bindkey -s "^r" "source $HOME/.zshrc\n" # refresh zsh configuration

# plugins
## syntax highlighting
SYNTAX_PLUGIN_LINUX_PATH='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
SYNTAX_PLUGIN_MAC_PATH='/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source $SYNTAX_PLUGIN_LINUX_PATH > /dev/null 2>&1 || source $SYNTAX_PLUGIN_MAC_PATH > /dev/null 2>&1 || echo "zsh syntax highlighting plugin is not installed"
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
function set_prompt {
    NEW_LINE=$'\n'
    POSITION_LINE='%F{green}%n@%m%f: %F{blue}%~%f'
    COMMAND_LINE='%(?.%F{green}>.%F{red}!)%f  %# '

    PROMPT='%B${PYTHON_VIRTUALENV} ${POSITION_LINE} %b'\$vcs_info_msg_0_' ${NEW_LINE} ${COMMAND_LINE}'
    RPROMPT='%F{blue}« %*'
}

# 'precmd' is a zsh hook that execute, each functions in precmd_functions, before your prompt is displayed
precmd_functions+=( precmd_vcs_info set_virtualenv set_prompt )
# zsh configuration END

# source the work related configuration
WORK_CONFIGURATION_PATH="$HOME/work/.zshrc"
# using if instead of && to prevent the .zshrc to have a exit status different than 0
if [ -f $WORK_CONFIGURATION_PATH ]; then source $WORK_CONFIGURATION_PATH; fi
