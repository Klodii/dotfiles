# set vim has default editor
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="brave-browser"
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.history
HISTSIZE=1000
SAVEHIST=1000
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
}

precmd_functions+=( set_virtualenv )
precmd_functions+=( set_prompt )

# aliases:

alias ll='ls -alF --color=auto'
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

# git
alias gc='git checkout'
alias gs='git status'
alias gl='git log'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
