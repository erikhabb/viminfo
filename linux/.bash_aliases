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
  export PATH="$HOME/.cargo/bin:$PATH"
  unalias ls
  export CLICOLOR=1
fi

# Burlywood specific
alias power4='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab4 --device host --action cycle'
alias power12='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab12 --device host --action cycle'
alias power30='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab30 --device host --action cycle'
alias power32='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab32 --device host --action cycle'
alias power36='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab36 --device host --action cycle'
alias ssh4='ssh ehabbinga@10.2.4.4'
alias ssh5='ssh ehabbinga@10.2.4.5'
alias ssh10='ssh ehabbinga@10.2.4.10'
alias ssh12='ssh ehabbinga@10.2.4.12'
alias ssh13='ssh ehabbinga@10.2.4.13'
alias ssh14='ssh ehabbinga@10.2.4.14'
alias ssh16='ssh ehabbinga@10.2.4.16'
alias ssh22='ssh ehabbinga@10.2.4.22'
alias ssh24='ssh ehabbinga@10.2.4.24'
alias ssh27='ssh ehabbinga@10.2.4.27'
alias ssh30='ssh ehabbinga@10.2.4.30'
alias ssh32='ssh ehabbinga@10.2.4.32'
alias ssh33='ssh ehabbinga@10.2.4.33'
alias ssh36='ssh ehabbinga@10.2.4.36'
alias ssh44='ssh ehabbinga@10.2.4.44'
alias ssh50='ssh ehabbinga@10.2.4.50'
alias ssh58='ssh ehabbinga@10.2.4.58'
alias ssh60='ssh ehabbinga@10.2.4.60'
alias ssh_work='ssh erik@10.2.29.15'

if [ -f /burlywood/tools/environment/modules-tcl/init/bash ]; then

  source /burlywood/tools/environment/modules-tcl/init/bash
  source /burlywood/tools/environment/modules-tcl/init/bash_completion

  if [[ -z ${LOADEDMODULES+x} ]]; then
    #echo Modules not loaded, loading burlywood/default...
    module load burlywood/default
  else
    #echo Modules loaded, purge and then load...
    module purge
    module load burlywood/default
  fi

fi

