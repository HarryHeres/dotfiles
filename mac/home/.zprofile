eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim=nvim

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-11-full.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home"
alias java=$JAVA_HOME/bin/java
alias rm="trash-put"
alias cat="bat"

export PATH=$PATH:~/.local/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:$HOME/.cargo/bin/
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# C/C++ specific 
export LIBRARY_PATH=$LIBRARY_PATH:"/usr/local/lib"
export LIBRARY_PATH=$LIBRARY_PATH:"/opt/homebrew/lib"
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:"/usr/local/lib"

export HOMEBREW_NO_AUTO_UPDATE=1

export MANGO_DEV="true"

eval "$(fzf --zsh)"
