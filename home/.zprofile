eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim=nvim

alias python=python3
alias pip="python -m pip"

# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@$11/11.0.20"
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.9"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-11-full.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home"
alias java=$JAVA_HOME/bin/java
# alias ssh="kitten ssh" 


export PATH=$PATH:~/.local/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:/opt/homebrew/Cellar/llvm/17.0.6/bin
export PATH=$PATH:$HOME/.cargo/bin/
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LIBRARY_PATH="/opt/homebrew/lib:/System/Library/Frameworks/OpenCL.framework"
export CC="gcc-13"
export CXX="g++-13"
export CPLUS_INCLUDE_PATH="/opt/homebrew/include:/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include:/opt/homebrew/opt/opencl-clhpp-headers/include"
export lara_dev="lara_dev"
export LARA_DEV="lara_dev"

eval "$(fzf --zsh)"
