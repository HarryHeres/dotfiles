# Zsh user configuration

alias python="python3"
alias pip="python -m pip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -r -R'
alias vim='nvim'
alias cat="bat"
alias rm="trash-put"
alias restore="trash-restore"
alias vpn-on="nmcli con up UBK-VPN"
alias vpn-off="nmcli con down UBK-VPN"

export JAVA_HOME=/usr/lib/jvm/default/
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="/home/harry/Programs/Looking-Glass-Client:$PATH"
export PATH="/home/harry/.local/bin:$PATH"

# Android stuff
export PATH="/home/harry/Android/Sdk/cmdline-tools/latest/bin/:$PATH"
export PATH="/home/harry/Android/Sdk/platform-tools/:$PATH"

export WINEPREFIX=/home/harry/.wine

export ANDROID_HOME=/home/harry/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
# . "$HOME/.cargo/env"
