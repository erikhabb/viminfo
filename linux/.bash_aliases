# prompt I like
case "$TERM" in
xterm*|rxvt*|screen*)
    PS1="[\[\033[32m\]\h@\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
    ;;
*)
    ;;
esac

# unset all aliases
unalias -a

# aliases I like
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias git_add_mod="git status | grep modified: | cut -d ' ' -f4- | xargs git add"
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vi='vim'

# save history immediately
PROMPT_COMMAND='history -a'

# mac specific
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -x $HOME/bin/nvim-osx64/bin/nvim ]; then
    export PATH="$HOME/bin/nvim-osx64/bin:$PATH"
    alias vi='nvim'
  fi
  # Setting PATH for Python 3.10
  # The original version is saved in .bash_profile.pysave
  export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
  # rust (if installed)
  export PATH="$HOME/.cargo/bin:$PATH"
  unalias ls
  export CLICOLOR=1
else
  if [ -x $HOME/bin/nvim-linux64/bin/nvim ]; then
    export PATH="$HOME/bin/nvim-linux64/bin:$PATH"
    alias vi='nvim'
  fi
fi

# Motorola specific
alias ssh_work_vm='ssh -p 2522 erik@127.0.0.1'

