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
		;;
	*)
		alias ls='ls --color=auto'
		;;
esac

export LSCOLORS=exfxcxafbxgxdxabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=30;45:ex=31:bd=36:cd=33:su=30;41:sg=30;46:tw=30;42:ow=30;43:st=34'

alias grep='grep --color=auto'
alias less='less -R'

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

alias reset-launchpad='defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock'

ulimit -n 4096

export NVM_DIR="$HOME/.nvm"
[ -f /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh --no-use

which rbenv > /dev/null && eval "$(rbenv init -)"

export PATH="$HOME/.fastlane/bin:$PATH"

[ -f /usr/local/share/bash-completion/bash_completion ] \
	&& . /usr/local/share/bash-completion/bash_completion

[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] \
	&& . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] \
	&& . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
