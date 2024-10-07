# Zsh user configuration

alias python="python3.9"
alias pip="python3.9 -m pip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -r -R'
alias vim='nvim'
alias docker="podman"
alias cat="bat"
alias rm="trash-put"
alias restore="trash-restore"
# alias python-slicer="/opt/3dslicer/bin/PythonSlicer"
# alias easyeffects="/bin/sh -c \"flatpak run com.github.wwmm.easyeffects --gapplication-service &\""

export JAVA_HOME=/usr/lib/jvm/default/
export TERM="xterm-256color"
export PATH="$PATH:/usr/local/texlive/2023/bin/x86_64-linux"
export PATH="$PATH:/home/harry/Programs/Looking-Glass-Client"
export PATH="$PATH:/home/harry/.local/bin"
export WINEPREFIX=/home/harry/.wine
# export C_INCLUDE_PATH="/home/harry/Projects/FOSS/graaf/include/:$C_INCLUDE_PATH"
# export CPATH="/home/harry/Projects/FOSS/graaf/include/graaflib/:$CPATH"
# export CPLUS_INCLUDE_PATH="/home/harry/Projects/FOSS/graaf/include/:$CPLUS_INCLUDE_PATH"
. "$HOME/.cargo/env"
