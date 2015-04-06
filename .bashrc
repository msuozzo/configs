# General Bash configs

## builtin Aliases
shopt -s expand_aliases
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ll='ls -alFG'
alias rm='rm -i $@'
cd() { builtin cd $@; ll; }


## Git 
source /usr/local/git/contrib/completion/git-completion.bash
#### Prompt (Based on: http://ithaca.arpinum.org/2013/01/02/git-prompt.html)
source /usr/local/git/contrib/completion/git-prompt.sh 
get_sha() {
  git rev-parse --short HEAD 2>/dev/null
}
PROMPT_COMMAND='__git_ps1 "\u::\W" " \\\$ " "{%s $(get_sha)}"'


## Python
#### Help
pyhelp() {
  if [[ $# -eq 1 ]]; then
    MOD=$1
    python -c "import $MOD; help($MOD)"
  elif [[ $# -eq 2 ]]; then
    PKG=$1
    MOD=$2
    python -c "from $PKG import $MOD; help($MOD)"
  fi
}
export -f pyhelp
