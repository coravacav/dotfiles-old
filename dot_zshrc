# Only run in interactive mode.
[[ $- != *i* ]] && return

source ~/.aliases.sh

#region opts

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
HISTDUP=erase
setopt notify
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
unsetopt autocd beep extendedglob nomatch

# Add my fun ctrl +a, etc. (emacs bindings)
bindkey -e

# arrowkey + direction
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mask/.zshrc'

# make completion non case specific
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#endregion

#region ENV

#region pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
#endregion

#region bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
#endregion

#region qmk
export PATH="$HOME/.local/bin:$PATH"
#endregion

#region deno
export DENO_INSTALL="/home/mask/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
#endregion

#region doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"
#endregion

#region brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#endregion

# use nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

#endregion

# mix
export PATH="$HOME/.mix/escripts:$PATH"

#region program configs
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
#endregion

# update chezmoi
zsh -c 'zsh ~/.chezmoiupdate.sh &'

# git aliases
if ! type "git-alias-aliaser" >/dev/null; then
    cargo install --path ~/shell-utils/git-alias-aliaser
fi
eval "$(git-alias-aliaser)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# GoLang
export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
# Onyx config
export ONYX_PATH="/Users/st/.onyx"
export PATH="$ONYX_PATH/bin:$PATH"
