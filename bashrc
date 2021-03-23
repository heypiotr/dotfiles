export PS1='\[\e[32m\]\u\[\e[38;05;8m\] at \[\e[33m\]\h\[\e[38;05;8m\] in \[\e[36m\]\w$(__git_ps1 "\[\e[38;05;8m\] on \[\e[31m\]%s")\[\e[0m\]
\[\e[38;05;8m\]$ \[\e[0m\]'

shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist

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

[ -f "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias g='git'
__git_complete g __git_main
git-cleanup ()
{
	git fetch -p
	for branch in `git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'`
	do
		git branch -D $branch
	done
}

alias be='bundle exec'

alias reset-launchpad='defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock'

ulimit -n 4096

[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -f "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use

# rbenv
which rbenv >/dev/null && eval "$(rbenv init -)"

# fastlane
[ -d "$HOME/.fastlane/bin" ] && export PATH="$HOME/.fastlane/bin:$PATH"

# android
if [ -d "$HOME/Library/Android/sdk" ]; then
	export ANDROID_HOME="$HOME/Library/Android/sdk"
	export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
fi

# java
/usr/libexec/java_home -v 1.8 >/dev/null 2>&1 && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# rust
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
