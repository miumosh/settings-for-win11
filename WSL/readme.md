# Installation
- before installation | update & upgrade


- before installation | set version management dotfiles …
    ```bash
    dotfilesPath="xxx/xxx/dotfiles"
    mkdir ${dotfilesPath}
    mv ~/.zshrc ${dotfilesPath}/
    ln -sf ${dotfilesPath}/.zshrc ~/.zshrc
    ```


- Git
    ```bash
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
    cat ~/.gitconfig
    ```


- GitHub Cli
    ```bash
    # https://github.com/cli/cli/blob/trunk/docs/install_linux.md
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
    
    # https://shikasen-engineer.com/github_auth/
    gh auth login
    # ? What account do you want to log into? GitHub.com
    # ? What is your preferred protocol for Git operations? HTTPS
    # ? Authenticate Git with your GitHub credentials? Yes
    # ? How would you like to authenticate GitHub CLI? Login with a web browser
    
    # ! First copy your one-time code: 4018-B52D
    # Press Enter to open github.com in your browser...
    # ! Failed opening a web browser at https://github.com/login/device
    #   exec: "xdg-open,x-www-browser,www-browser,wslview": executable file not found in $PATH
    #   Please try entering the URL in your browser manually
    # ✓ Authentication complete.
    # - gh config set -h github.com git_protocol https
    # ✓ Configured git protocol
    # ✓ Logged in as myk-i
    ```


- zsh
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


- oh-my-zsh
    ```bash
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    source ~/.zshrc
    ```


- zsh-completions / zsh-autosuggestions
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


- fzf
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    
    vi ~/.zshrc
    # -----------------------------------------
    export FZF_DEFAULT_OPTS='--layout=reverse'
    # -----------------------------------------
    ```


- Docker
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


- asdf ( python / nodejs / terraform )
    ```bash
    #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    vi ~/.zshrc
    # ------------------
    plugin ( ... asdf)
    # ------------------
    source ~/.zshrc



    # Install python, node, terraform

    # for python
    #https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    sudo apt update; sudo apt install gcc make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    
    # for terraform
    sudo apt-get install zip
    
    # current installed
    asdf plugin list
    # check install availability
    asdf plugin list all | egrep -i "python|node|terraform"
    
    # python
    target="python"
    asdf plugin add $target
    asdf plugin list
    asdf list all $target
    ver="3.10.0"
    asdf install $target $ver
    asdf list $target
    asdf global $target $ver
    python3 -V
    
    # nodejs
    target="nodejs"
    asdf plugin add $target
    asdf plugin list
    asdf list all $target
    ver="18.0.0"
    asdf install $target $ver
    asdf list $target
    asdf global $target $ver
    node -v
    npm -v
    
    # terraform
    target="terraform"
    asdf plugin add $target
    asdf plugin list
    asdf list all $target
    ver="1.4.0"
    asdf install $target $ver
    asdf list $target
    asdf global $target $ver
    terraform -v
    ```


- jq /  gron
    ```bash
    # jq
    apt-get install -y jq
    
    # gron
    # https://github.com/tomnomnom/gron
    tar xzf gron-linux-amd64-0.1.5.tgz
    sudo mv gron /usr/local/bin/
    ```


- go
    ```bash
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install golang-go
    ```


- ghq
    ```bash
    # ghq, gh, tig, 
    scoop install ghq
    # Updating Scoop...
    # Updating 'main' bucket...
    #  * 4d456b56e ruff: Update to version 0.0.259                             2 hours ago
    #  * d58326f51 eksctl: Update to version 0.135.0                           2 hours ago
    #  * ce9197a0d 1password-cli: Update to version 2.16.0                     2 hours ago
    #  * d3197ade7 lzip: Update to version 1.22 (#4593)                        3 hours ago
    #  * 13abe2cc6 offlineinsiderenroll: Update to version 0.6.4 (#4594)       3 hours ago
    #  * 98de4b77c portal: Add version 1.2.3 (#4592)                           5 hours ago
    #  * 9c317b5b9 flaresolverr: Update to version 3.1.0 (#4596)               5 hours ago
    # Scoop was updated successfully!
    # Installing 'ghq' (1.4.1) [64bit] from main bucket
    # ghq_windows_amd64.zip (3.5 MB) [==============================================================================] 100%
    # Checking hash of ghq_windows_amd64.zip ... ok.
    # Extracting ghq_windows_amd64.zip ... done.
    # Linking ~\scoop\apps\ghq\current => ~\scoop\apps\ghq\1.4.1
    # Creating shim for 'ghq'.
    # 'ghq' (1.4.1) was installed successfully!
    
    go install github.com/x-motemen/ghq@latest
    # ~/.zshrc
    export PATH=$PATH:/home/miyakei/go/bin
    ```


- tig ( yet )

- tmux
    - Installed default in 22.04.1 LTS
    - copy  ~/.tmux.conf


- net-tools
    ```bash
    apt install net-tools
    ```


- aws cli
    ```bash
    # https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    
    # completion for zsh
    # ~/.zshrc
    # ---------------------------------------------
    complete -C '/usr/local/bin/aws_completer' aws
    # ---------------------------------------------
    ```


- az cli
    ```bash
    # https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli-linux?pivots=apt
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    ```


- kubectl
    ```bash
    # https://kubernetes.io/ja/docs/tasks/tools/install-kubectl/
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubect
    sudo mv ./kubectl /usr/local/bin/kubectll
    ```