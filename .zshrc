alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

# git auto completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -u

# asdf
if [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
    source "$(brew --prefix asdf)/libexec/asdf.sh"
    source <(asdf completion zsh)
fi

# kubectl
if [ -f "$(brew --prefix)/opt/kubectl/bin/kubectl" ]; then
    source <(kubectl completion zsh)
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
