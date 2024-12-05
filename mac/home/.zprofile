eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim=nvim

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-11-full.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home"
alias java=$JAVA_HOME/bin/java
alias rm="trash-put"
alias cat="bat"
alias bash=/opt/homebrew/bin/bash

export PATH=:~/.local/bin:$PATH
export PATH=:$JAVA_HOME/bin:$PATH
export PATH=:$HOME/Library/Android/sdk/platform-tools/:$PATH
export PATH=:/opt/homebrew/bin:$PATH
export PATH=:$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=:$HOME/.cargo/bin/:$PATH
export PATH="/opt/homebrew/opt/ruby/bin/"::$PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# C/C++ specific 
export LIBRARY_PATH=$LIBRARY_PATH:"/usr/local/lib"
export LIBRARY_PATH=$LIBRARY_PATH:"/opt/homebrew/lib"
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:"/usr/local/lib"

export HOMEBREW_NO_AUTO_UPDATE=1

export ANDROID_HOME="/Users/harry/Library/Android/sdk"

source <(fzf --zsh)
