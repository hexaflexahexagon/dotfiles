alias ls="ls --color=auto"
alias ll="ls -lah"
alias lt="ls -laht"
alias vi="vim"

alias gad="git add ."
alias gap="git add -p"

alias gip="git push"
alias gis="git status"
alias gic="git commit"
alias gid="git diff"

alias glog="git log --pretty=format:'%C(auto)%H Author: %an%n    %s%n%b'"
alias glogl="git log --pretty=format:'%C(auto)commit %H%nAuthor: %an%nDate: %ad%n    %s%n%b%n '"
alias gpat="git format-patch -1"

alias gistlist="gh gist list -L 9999"

alias py="python"
alias py3="python3"
alias python="python3"

alias cls="clear"
alias :q="echo fool"
alias :wq=":q"

alias bashrc="source ~/.bashrc"

# If running under WSL
if [[ $(grep Microsoft /proc/version) ]]; then
	alias exp="explorer.exe ."
fi
