#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#		/usr/bin/pipewire & /usr/bin/pipewire-pulse & /usr/bin/wireplumber &
#		/usr/bin/wl-clip-persist --clipboard primary &
#fi


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -r -R'
alias vim='nvim'
alias python-slicer="/opt/3dslicer/bin/PythonSlicer"
# alias easyeffects="/bin/sh -c \"flatpak run com.github.wwmm.easyeffects --gapplication-service &\""

export JAVA_HOME=/usr/lib/jvm/default/
PS1='[\u@\h \W]\$ '
export TERM="xterm-256color"
export PATH="$PATH:/usr/local/texlive/2023/bin/x86_64-linux"
export PATH="$PATH:/home/harry/Programs/Looking-Glass-Client"

# export C_INCLUDE_PATH="/home/harry/Projects/FOSS/graaf/include/:$C_INCLUDE_PATH"
# export CPATH="/home/harry/Projects/FOSS/graaf/include/graaflib/:$CPATH"
# export CPLUS_INCLUDE_PATH="/home/harry/Projects/FOSS/graaf/include/:$CPLUS_INCLUDE_PATH"
. "$HOME/.cargo/env"
