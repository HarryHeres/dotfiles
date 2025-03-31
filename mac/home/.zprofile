eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=:~/.local/bin:$PATH
export PATH=:$JAVA_HOME/bin:$PATH
export PATH=:$HOME/Library/Android/sdk/platform-tools/:$PATH
export PATH=:/opt/homebrew/bin:$PATH
export PATH=:$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=:$HOME/.cargo/bin/:$PATH
export PATH="/opt/homebrew/opt/ruby/bin/":$PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export JAVA_HOME="/opt/homebrew/Cellar/openjdk/23.0.2/"
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@21/21.0.6/"
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.14/"

# C/C++ specific 
export LIBRARY_PATH="/usr/local/lib":"/opt/homebrew/lib"
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:"/usr/local/lib"

export HOMEBREW_NO_AUTO_UPDATE=1

export ANDROID_HOME="/Users/harry/Library/Android/sdk"

alias vim=nvim
alias java=$JAVA_HOME/bin/java
alias rm="trash-put"
alias cat="bat"
alias bash=/opt/homebrew/bin/bash

source <(fzf --zsh)
