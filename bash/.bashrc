#########################################
#prompt settings
#########################################
export PS1='\[\033[0;35m\]\u@\h\[\033[0m\] \[\033[0;36m\]\W\[\033[0m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\] \$ '

function git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
