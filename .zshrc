# zsh configuration
# -----
# initialize autocompletion
setopt auto_cd
autoload -Uz compinit; compinit
# set up history
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt NO_BEEP
# use emacs keybinding
bindkey -e
# autocompletion (based on history)
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# enable git prompt
source ~/.zsh/plugins/git/git-prompt.sh
# git prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM='verbose'
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_COMPRESSSPARSESTATE=true
# enable command-subsitution in ps1
setopt PROMPT_SUBST
NL=$'\n'
PS1='$NL%B%F{cyan}%0~%f%b% %F{magenta}$(__git_ps1 "  %s")%f$NL%B%(?.%F{green}.%F{red})%(!.#.$)%f%b '
# activate autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# nvim as vim local
alias vim=nvim
# source .profile
source $HOME/.profile
