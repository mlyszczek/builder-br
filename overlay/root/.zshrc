eval `dircolors -b ~/.dircolors`
export TERM=rxvt-unicode-256color
[ -n "$TMUX" ] && export TERM=screen-256color
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '~/.zshrc'

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

autoload -Uz compinit
compinit

setopt correctall
setopt appendhistory
setopt extendedglob
setopt nomatch
setopt notify
setopt hist_ignore_all_dups

unsetopt correct_all
unsetopt correct
unsetopt autocd
unsetopt beep

umask 026

HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
bindkey -v
bindkey '^r' history-incremental-pattern-search-backward

export NMON=cmdlkn
export LD_LIBRARY_PATH="/usr/local/lib64"
export PATH="$PATH:/usr/arm-nuttx-eabi/bin:/usr/local/bin"
export QT_SELECT=5
export XDG_CURRENT_DESKTOP=qt5ct
export QT_QPA_PLATFORM_THEME=qt5ct
export DISPLAY=:0

# oh my zsh

export ZSH=~/.oh-my-zsh
export DISABLE_AUTO_UPDATE="true"
ZSH_THEME="gnzh"
COMPLETION_WAITING_DOTS="true"
plugins=(git colorize)
source $ZSH/oh-my-zsh.sh

# custom aliases

alias ls='ls --color --group-directories-first'
alias l='ls -lh --group-directories-first'
alias lsa='ls -lha --group-directories-first'
alias grep='grep --color=auto --exclude-dir=".svn"'
alias gits='git status'
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tb="nc tb.kurwinet.pl 8002"
alias kl="cat - <(echo 'kurload') | nc kurwinet.pl 1337"
alias mkpass='makepasswd --chars=31'
alias youtube-ogg='youtube-dl --audio-format vorbis --audio-quality 0 --extract-audio'
