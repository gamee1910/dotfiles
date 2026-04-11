export XMODIFIERS=@im=ibus
source "$HOME/.zsh/spaceship/spaceship.zsh"
export PATH=$PATH:/usr/local/go/bin
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/nvim/bin:$PATH"
