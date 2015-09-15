export PS1='\[\e[32m\]\u\[\e[38;05;8m\] at \[\e[33m\]\h\[\e[38;05;8m\] in \[\e[36m\]\w$(__git_ps1 "\[\e[38;05;8m\] on \[\e[31m\]%s")\[\e[0m\]
\[\e[38;05;8m\]$ \[\e[0m\]'

shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

export EDITOR=vim

case $OSTYPE in
  darwin*)
    alias ls='ls -G'
    [[ -f $(brew --prefix)/share/bash-completion/bash_completion ]] && . $(brew --prefix)/share/bash-completion/bash_completion
    ;;
  *)
    alias ls='ls --color=auto'
    ;;
esac

[[ -d $HOME/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"
which rbenv > /dev/null && eval "$(rbenv init -)"

export GREP_OPTIONS='-n --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

alias g='git'
_git_g_alias() { _xfunc git _git; }
complete -o default -o nospace -F _git_g_alias g

alias be='bundle exec'

export LSCOLORS=exfxcxafbxgxdxabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=30;45:ex=31:bd=36:cd=33:su=30;41:sg=30;46:tw=30;42:ow=30;43:st=34'

ulimit -n 4096

if [[ -d $HOME/.nvm ]]; then
  export NVM_DIR="$HOME/.nvm"
  source $(brew --prefix nvm)/nvm.sh
fi
