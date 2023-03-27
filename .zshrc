# ------------------------------------------------------------
# zsh
# ------------------------------------------------------------
setopt no_beep
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
setopt print_eight_bit

export LANG=ja_JP.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# ------------------------------------------------------------
# oh-my-zsh
# ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	      git
        zsh-completions
        zsh-autosuggestions
	      asdf
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------
# fzf + ghq
# ------------------------------------------------------------
export FZF_DEFAULT_OPTS='--layout=reverse'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

$ repo() {
  declare -r REPO_NAME="$(ghq list >/dev/null | fzf-tmux --reverse +m)"
  [[ -n "${REPO_NAME}" ]] && cd "$(ghq root)/${REPO_NAME}"
}

# ------------------------------------------------------------
# completion
# ------------------------------------------------------------
# aws 
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

# az 
# autoload -U +X bashcompinit && bashcompinit
source /usr/local/bin/az.completion

# terraform 
# autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/miyakei/.asdf/installs/terraform/1.4.0/bin/terraform terraform

# ------------------------------------------------------------
# golang
# ------------------------------------------------------------
export PATH=$PATH:/home/miyakei/go/bin

# ------------------------------------------------------------
# alias
# ------------------------------------------------------------
alias ll="ls -la"
alias ee="explorer.exe"
