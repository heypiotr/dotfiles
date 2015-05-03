export PS1='\[\e[32m\]\u\[\e[38;05;8m\] at \[\e[33m\]\h\[\e[38;05;8m\] in \[\e[36m\]\w$(__git_ps1 "\[\e[38;05;8m\] on \[\e[31m\]%s")\[\e[0m\]
\[\e[38;05;8m\]→ \[\e[0m\]'

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

    if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
  *)
    alias ls='ls --color=auto'
    ;;
esac

if [[ -d /usr/local/var/rbenv ]]; then export RBENV_ROOT='/usr/local/var/rbenv'; fi
if [[ -d $HOME/.rbenv/bin ]]; then export PATH="$HOME/.rbenv/bin:$PATH"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GREP_OPTIONS='-n --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

alias g='git'

alias be='bundle exec'
