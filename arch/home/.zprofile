# Zsh user configuration
export WINEPREFIX=/home/harry/.wine
export ANDROID_HOME=/home/harry/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export LC_ALL=C.UTF-8

export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"

alias python="python3"
alias pip="python -m pip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -r -R'
alias vim='nvim'
alias cat="bat"
alias rm="trash-put"

eval "$(direnv hook zsh)"
