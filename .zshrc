# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
#alias ls="eza -G --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# my shortcuts
alias android="~/android-studio/bin/studio.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
source "$HOME/.cargo/env"
alias theme='bash -c  "$(wget -qO- https://git.io/vQgMr)"'

# bun completions
[ -s "/home/pokhrelashok2/.bun/_bun" ] && source "/home/pokhrelashok2/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
alias dart-watch="dart run build_runner watch"
alias dart-build="dart run build_runner build --delete-conflicting-outputs"
export QT_QPA_PLATFORM=xcb
alias chrome-clean="rm -rf ~/.config/google-chrome-unstable/Singleton*"

export PATH="/usr/bin/flutter/bin:$PATH"


function pp() {
    local base_dir=~/projects
    local session_name
    local folder

    # Check if already inside a tmux session
    if [ -n "$TMUX" ]; then
        echo "You are already inside a tmux session."
        return 1
    fi

    # List subfolders and select one using fzf
    folder=$(find "$base_dir" -maxdepth 1 -type d ! -path "$base_dir" | fzf --prompt="Select a folder: " --preview="echo {} | xargs -I % ls -ld %")

    # Check if a folder was selected
    if [ -z "$folder" ]; then
        echo "No folder selected or invalid selection."
        return 1
    fi

    # Extract the session name from the folder path
    session_name=$(basename "$folder")

    # Create tmux session if it doesn't exist
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -d -s "$session_name" "cd '$folder' && nvim"
        tmux send-keys -t "$session_name".1 ":NvimTreeToggle" C-m
    fi

    # Attach to the session
    tmux attach -t "$session_name"
}
