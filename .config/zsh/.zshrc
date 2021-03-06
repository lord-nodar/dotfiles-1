#   __ _  ____ ___ 
#  / _` ||_  // __| GITHUB:https://github.com/gabrielzschmitz               
# | (_| | / / \__ \ INSTAGRAM:https://www.instagram.com/gabrielz.schmitz/
#  \__, |/___||___/ DOTFILES:https://github.com/gabrielzschmitz/dotfiles/
#  |___/    
# 
# A customized Zsh Config by gabrielzschmitz using Faint Colors
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
# mkdir -p "$HOME/.config/zsh"
# git clone https://github.com/reobin/typewritten.git "$HOME/.config/zsh/typewritten"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh
plugins=(git)
PROMPT_EOL_MARK=''
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTFILE=$HOME/.config/zsh/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

# Preferred editor and visual for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim';
   export VISUAL='nvim';
else
   export EDITOR='nvim';
   export VISUAL='nvim';
fi

# Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.config/zsh/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
# End of Zinit's installer chunk
# ZPlugin
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-completions
zplugin light buonomo/yarn-completion

# Typewritten theme
export TYPEWRITTEN_COLOR_MAPPINGS="primary:red;secondary:green;accent:green"
fpath+=$HOME/.config/zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Man pages colors
export LESS_TERMCAP_mb=$'\e[0;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;41;30m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;36m'

# Set 256 color terminal
export TERM=xterm-256color

# Aliases
alias lsd='lsd -hA --group-dirs first'
alias ls='lsd --group-dirs first'
alias grep='grep --color=auto'
alias bat='bat --theme="base16" --style="numbers,changes"'
alias cat='bat --theme="base16" --style="numbers,changes"'
alias dots='/usr/bin/git --git-dir=$HOME/Documents/dotfiles --work-tree=/home/gabrielzschmitz'
alias vimwiki='nvim $HOME/Documents/Wiki/index.md'
alias vimwikidiary='nvim $HOME/Documents/Wiki/Diary/diary.md'
alias pandoc='pandoc -s -o'
alias zshrc='nvim $HOME/.config/zsh/.zshrc'
alias sourcezshrc='source .config/zsh/.zshrc'
alias colors='nvim $HOME/.scripts/faintcolorscheme.vim'
alias celluloid='devour celluloid'
alias mpv='devour mpv'
alias feh='devour feh'
alias sxiv='devour sxiv'
alias zathura='devour zathura'

# Dennis Ritchie quote
alias unix='sh $HOME/.scripts/faintfetch.textart'
sh $HOME/.scripts/faintfetch.textart

