alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

# auto completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -u

# kubectl
if [ -f "$(brew --prefix kubectl)/bin/kubectl" ]; then
    source <(kubectl completion zsh)
fi

# gcloud
if [ -f /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc ]; then
    source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
fi

# zsh-autosuggestions
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# git-prompt
if [ -f "$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh" ]; then
    source "$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh"
    precmd() { __git_ps1 '
[%n@%m %~]' '
$ ' }
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWUPSTREAM=verbose
    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_STATESEPARATOR='|'
fi
