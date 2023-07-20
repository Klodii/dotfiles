export VISUAL='vi' # set a default that should always work
# overwrite VISUAL if we can find nvim
# we can enhance the editor search by searching in each directory of $PATH
PATH_SPACED=${PATH//:/ } # separate each path by space instead of :
# =~ tels zsh to force whitespace splitting and filename expansion
# it is not necessary with bash
for individual_path in ${=~PATH_SPACED}; do
    # true if file exist and is executable
    [ -x "$individual_path/nvim" ] && export VISUAL='nvim' && break
done
export EDITOR="$VISUAL"
alias edit="$VISUAL" # provide a command to use on all systems

export BROWSER="brave-browser"

# usefull function
# usage: mcd <dir>
function mcd {
    local newdir='_mcd_command_failed'
    if [ -d "$1" ]; then
        echo "$1 already exists"
        newdir="$1"
    else
        command mkdir -p "$1" && newdir="$1"
    fi
    builtin cd "$newdir"
}

# Lines configured by zsh-newuser-install
export HISTFILE=~/.cache/zsh/.history
export HISTSIZE=1000
export SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/klaudjan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom addition
autoload -Uz compinit && compinit


# show git branch

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
    RPROMPT='«'
}

precmd_functions+=( set_virtualenv )
precmd_functions+=( set_prompt )

# aliases:

alias ll='ls -AlFh --color=auto'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias diff='diff --color=always'

alias myip='curl -4 https://get.geojs.io/v1/ip'
# copy and paste directly from terminal
# install xclip with: sudo apt-get install xclip
# You can then pipe the output into xclip to be copied into the clipboard
alias cclip='xclip -selection clipboard'
# or To paste the text you just copied, you shall use:
alias vclip='xclip -o -selection clipboard'

alias cmyip='curl -4 https://get.geojs.io/v1/ip | cclip'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias .files='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
