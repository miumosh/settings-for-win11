# ------------------------------------------------------------
# zsh
# ------------------------------------------------------------
setopt no_beep
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
setopt inc_append_history
setopt print_eight_bit

#export LANG=ja_JP.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# fix "no match error"
setopt +o nomatch

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
        docker
        docker-compose
        helm
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------
# fzf + ghq
# ------------------------------------------------------------
export FZF_DEFAULT_OPTS='--layout=reverse'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------
# completion
# ------------------------------------------------------------
# aws 
complete -C '/usr/local/bin/aws_completer' aws

# az 
source /usr/local/bin/az.completion

# terraform 
complete -o nospace -C /home/miyakei/.asdf/installs/terraform/1.4.0/bin/terraform terraform

# kubectl
source <(kubectl completion zsh)

# helm
source <(helm completion zsh)

# gh
eval "$(gh completion -s zsh)"

# ------------------------------------------------------------
# docker
# ------------------------------------------------------------
export PATH=$PATH:/usr/bin/docker

# ------------------------------------------------------------
# golang
# ------------------------------------------------------------
export PATH=$PATH:/home/miyakei/go/bin

# ------------------------------------------------------------
# direnv
# ------------------------------------------------------------
eval "$(direnv hook zsh)"

# ------------------------------------------------------------
# kubernetes
# ------------------------------------------------------------
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ------------------------------------------------------------
# gcloud
# ------------------------------------------------------------
GCLOUD_SDK_PATH="${HOME}/google-cloud-sdk"
GCLOUD_PATH_ZSH="${GCLOUD_SDK_PATH}/path.zsh.inc"
GCLOUD_COMPLETION_ZSH="${GCLOUD_SDK_PATH}/completion.zsh.inc"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${GCLOUD_PATH_ZSH}" ]; then
  . "${GCLOUD_PATH_ZSH}"
fi

# The next line enables shell command completion for gcloud.
if [ -f "${GCLOUD_COMPLETION_ZSH}" ]; then
  . "${GCLOUD_COMPLETION_ZSH}"
fi

# ------------------------------------------------------------
# alias
# ------------------------------------------------------------
alias ll="ls -la"
alias ee="explorer.exe"

alias  d="docker"
alias dc="docker-compose"
alias  k="kubectl"
alias ek="eksctl"
alias  h="helm"

alias  gs="git status"
alias  ga="git add"
alias  gl="git log --oneline --graph"
alias  gc="git commit"
alias gps="git push origin HEAD"
alias gpl="git pull origin HEAD"

alias repo='cd $(ghq list -p | fzf)'
