### WSL: v2
### Distribution: Ubuntu 22.04.1 LTS



# zsh
```bash
echo $SHELL
sudo apt install -y zsh
zsh --version
which zsh
chsh -c $(which zsh)


# merge .zsh_history
# maintenance .zsh_history if you need

# cp -p ~/.zsh_history ~/.zsh_history.$(date +%Y%m%d)
# cat ~/.zsh_history | sort | uniq > ~/.zsh_history
```



# oh-my-zsh
```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
source ~/.zshrc
```



# zsh-completions / zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

vi ~/.zshrc
# -----------------------------------------
plugins=(
        git
        zsh-completions
        zsh-autosuggestions
)
...
autoload -U compinit && compinit
# -----------------------------------------
```



# fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

vi ~/.zshrc
# -----------------------------------------
export FZF_DEFAULT_OPTS='--layout=reverse'
# -----------------------------------------
```



# asdf
```bash
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
vi ~/.zshrc
# ------------------
plugin ( ... asdf)
# ------------------
source ~/.zshrc



# for python
#https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update; sudo apt install gcc make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# for terraform
sudo apt-get install zip



asdf plugin list all
# ex
target="xxx"
asdf plugin add $target
asdf plugin list
asdf list all $target
ver="xxx"
asdf install $target $ver
asdf list $target
asdf global $target $ver
asdf current



declare -a tuples=(
    "act 0.2.40"
    "ansible-base 2.10.16"
    "argocd 2.6.0"
    "direnv 2.32.0"
    "eksctl 0.135.0"
    "helm 3.10.0"
    "kind 0.18.0"
    "minikube 1.26.0"
    "mongosh 1.6.0"
    "nodejs 18.0.0"
    "python 3.8.0"
    "stern 1.24.0"
    "terraform 1.4.0"
    "yarn 1.22.0"
    "yq 4.30.8"
    # next try -------
    "jq xxx"
    "go xxx"
    "ghq xxx"
    "awscli xxx"
    "azure-cli xxx"
    "kubectl xxx"
    "minikube"
    # next try -------
    # tmux          : default installed
    # docker        : doesn't exist
    # docker-compose: only v1
    # gron          : doesn't exist
    # -> install binaly -> set /usr/local/bin/
)
# for i in ${tuples[@]}; do echo $i; done

for tuple in ${tuples[@]}
do
    set -- $tuple
    plugin=$1
    version=$2
    asdf plugin add $plugin
    asdf install $target $ver
    asdf global $target $ver
done

asdf current
```


# Docker
```bash
# install init
sudo apt-get install ca-certificates curl gnupg lsb-release

# get GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# update repository
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# install docker
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt update
sudo service docker start

# vi /etc/wsl.conf
# ------------------------------
[boot]
command = service docker start
# ------------------------------

# check docker
sudo docker container run --rm hello-world

# sudo
getent group | grep -i docker
> docker:x:998:
sudo usermod -aG docker $USER
exit
docker ps
# error...
# https://zenn.dev/tkzwhr/articles/trouble-shooting-wsl2-docker
# sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
# sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

# docker-compose
sudo apt install docker-compose
docker-compose --version
```
