# setopt
setopt no_beep
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
setopt print_eight_bit

# exports
export LANG=ja_JP.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_OPTS='--layout=reverse'

# variables
ZSH_THEME="robbyrussell"

# plugins
plugins=(
	git
        zsh-completions
        zsh-autosuggestions
)

# sources
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#alias
alias ll="ls -la"
alias ee="explorer.exe"
