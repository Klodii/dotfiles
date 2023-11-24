# Exports
export VISUAL='vi' # set a default that should always work
hash nvim && export VISUAL='nvim' # overwrite VISUAL if nvim is installed
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/bin"

# shell history
export HISTFILE=~/.cache/zsh/.history # make sure the directory exists, otherwise the file will not be created
export HISTSIZE=1000
export SAVEHIST=1000

export BROWSER="brave-browser"

# Functions
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

# zsh configuration start
setopt correct            # Auto correct mistakes
setopt nobeep             # No beep
setopt appendhistory      # Immediately append history instead of overwriting
setopt inc_append_history # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace    # Don't save commands that start with space
unsetopt beep
bindkey -v
autoload -Uz compinit && compinit

## Plugins section: Enable fish style features
# Use syntax highlighting
SYNTAX_PLUGIN_LINUX_PATH='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
SYNTAX_PLUGIN_MAC_PATH='/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source $SYNTAX_PLUGIN_LINUX_PATH > /dev/null 2>&1 || source $SYNTAX_PLUGIN_MAC_PATH > /dev/null 2>&1 || echo "zsh syntax highlighting plugin is not installed"
# zsh configuration end


# Prompt
# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
zstyle ':vcs_info:*' enable git

set_virtualenv() {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="%F{cyan}[`basename \"$VIRTUAL_ENV\"`]%f"
  fi
}

set_prompt(){
    NEW_LINE=$'\n'
    POSITION_LINE='%F{green}%n@%m%f: %F{blue}%~%f'
    COMMAND_LINE='%(?.%F{green}>.%F{red}!)%f  %# '
    PROMPT='%B${PYTHON_VIRTUALENV} ${POSITION_LINE} %b'\$vcs_info_msg_0_' ${NEW_LINE} ${COMMAND_LINE}'
    # add a character to the right side of the prompt
    # in this way it becomes more easier to identify the prompt row
    RPROMPT='%F{blue}« %*'
}

precmd_functions+=( set_virtualenv )
precmd_functions+=( set_prompt )

# Aliases
# my git alias for dotflies repository
alias .files='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias edit="$VISUAL" # provide a command to use on all systems
alias ll='ls -AlFh --color=auto'
alias mv='mv -v'
alias cp='cp -v -i' # verbose and confirm before overwriting something
alias rm='rm -v'
alias diff='diff --color=always'
alias extract='tar -xf' # extract (-x) the archive file (-f) specified. It must be .tar.gz

alias myip='curl -4 https://get.geojs.io/v1/ip'
# copy and paste directly from terminal
# install xclip with: sudo apt-get install xclip
# You can then pipe the output into xclip to be copied into the clipboard
alias cclip='xclip -selection clipboard'
# or To paste the text you just copied, you shall use:
alias vclip='xclip -o -selection clipboard'

alias cmyip='curl -4 https://get.geojs.io/v1/ip | cclip'

# the command bat is called batcat in Ubuntu, it is too long
# so, if the command batcat exists (--version does not exit with 1) then we
# will create the alias to abbreviate the command name.
# we redirect the stdout and stderror (2>&1) to the stdout and redirect this in
# /dev/null, to avoid print messages on the terminal
batcat --version > /dev/null 2>&1 && alias bat='batcat'
# arhclinux open command is named xdg-open
xdg-open --help > /dev/null 2>&1 && alias open='xdg-open'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Source the work related configuration
WORK_CONFIGURATION_PATH="$HOME/work/.zshrc"
[ -f $WORK_CONFIGURATION_PATH ] && source $WORK_CONFIGURATION_PATH

