export PS1='\[\e[32m\]\u\[\e[38;05;8m\] at \[\e[33m\]\h\[\e[38;05;8m\] in \[\e[36m\]\w$(__git_ps1 "\[\e[38;05;8m\] on \[\e[31m\]%s")\[\e[0m\]
\[\e[38;05;8m\]$ \[\e[0m\]'
export PS1="\e]0;\W\a$PS1"

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend

export HISTSIZE=10000
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

alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

alias grep='grep --color=auto'
alias less='less -R'

ulimit -n 4096

export PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"

# homebrew
# ... on macos
if [ -f "/usr/local/bin/brew" ]; then
	eval "$(/usr/local/bin/brew shellenv)"

	[ -f "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"
# ... on linux
elif [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

	for i in "/home/linuxbrew/.linuxbrew/etc/bash_completion.d"/*; do
		. "$i"
	done
fi

# android
if [ -d "$HOME/Library/Android/sdk" ]; then
	export ANDROID_HOME="$HOME/Library/Android/sdk"
	export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
fi

# git
alias g='git'
[ -f "/usr/share/bash-completion/completions/git" ] && . "/usr/share/bash-completion/completions/git"
__git_complete g __git_main
git-cleanup() {
	git fetch -p
	for branch in `git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'`
	do
		git branch -D $branch
	done
}
git-fixup() {
	git commit --fixup="$1" && git rebase -i "$1^" --autosquash
}

# java
/usr/libexec/java_home -v 1.8 >/dev/null 2>&1 && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# macos
alias reset-launchpad='defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock'

# node
if which n >/dev/null; then
	export N_PREFIX="$HOME/.local"
	export N_PRESERVE_NPM=1
fi

# ruby
alias be='bundle exec'
which rbenv >/dev/null && eval "$(rbenv init -)"

# rust
[ -f "$HOME/.cargo/env" ] &&  . "$HOME/.cargo/env"
