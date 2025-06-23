# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
eval "$(starship init zsh)"
# Path to your Oh My Zsh installation.
source ~/.local/share/omakub/defaults/bash/aliases
plugins=(git)

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /usr/share/doc/fzf/examples/key-bindings.zsh

eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias dd="clear"
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"

alias ze='function _ze() { if [ $# -eq 0 ]; then zellij; else zellij attach "$1"; fi; }; _ze'
alias zs='_zs() { SESSION=$(zellij ls | grep "resurrect" | cut -d " " -f 1 | gum choose --header "Choose the session"); zellij attach "$SESSION"; }; _zs'
alias zc='_zc() { SESSION=$(gum input --placeholder "Enter new session name"); zellij attach --create "$SESSION"; }; _zc'

alias ss='source install/setup.zsh'
alias sl='source install/local_setup.zsh'

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
. "$HOME/.cargo/env"

export PATH=$PATH:/home/anipr2002/.spicetify
source /opt/ros/jazzy/setup.zsh


source /home/anipr2002/CODE/ROS_WS/ros_ws/install/local_setup.zsh


bindkey -e
bindkey '^p' History-search-backword
bindkey '^n' History-search-forword
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi


# Load zsh-completions
autoload -U compinit && compinit


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


#Zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

#ZSTYLE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# pnpm
export PNPM_HOME="/home/anipr2002/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/anipr2002/.bun/_bun" ] && source "/home/anipr2002/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
source ~/.nvm/nvm.sh
