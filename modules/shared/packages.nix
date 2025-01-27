{ pkgs, ... }: 
with pkgs; [
    age
    age-plugin-yubikey
    bat
    coreutils
    curl
    direnv
    docker
    docker-buildx
    docker-compose
    gh
    git
    gnumake
    gnupg
    go
    go-task
    grype
    hackrf
    httpie
    ipcalc
    iperf
    ipmitool
    jq
    jwt-cli
    kubectl
    kubernetes-helm
    nmap
    nodejs
    nodePackages.prettier
    nodePackages.npm
    openssh
    opentofu
    sops
    syft
    tree
    vim
    wget
    yq
    zip
    zsh
]