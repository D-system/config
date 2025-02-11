# compinit: helper for auto-completion
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$($HOME/.local/bin/mise activate zsh)"

# Load SCM Breeze first because it conflict with something when outside of a git project
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Expand alias
zstyle ':completion:*' completer _expand_alias _complete _ignored

alias ls='ls -G'
alias l='ls -lh'
alias la='l -a'
alias ls="eza --git"

alias rg='rg -i'

alias cat="bat --plain"

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitlog='glog'
alias gpo='git push -u origin "$(git symbolic-ref --short HEAD)"'
alias gsu='git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`'


alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/\`--\1/g'"
alias clone_site='wget --mirror --convert-links --backup-converted --no-clobber --adjust-extension --wait=5 --limit-rate=20k' # shorter equivalent: 'wget -m -k -K -nc -E -w --limit-rate=20k'

alias grep='grep --color=auto -i'
alias be='bundle exec'
alias r='rails'
alias c="code"


serve() {
  ruby -run -ehttpd -- --port $1
}

export PATH="$HOME/.cargo/bin:${PATH}"


export EDITOR="code --wait"


export RUBY_YJIT_ENABLE=true

export FZF_COMPLETION_TRIGGER=''
source <(fzf --zsh)
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# Command highlight
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
