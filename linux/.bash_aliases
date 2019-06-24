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

# Burlywood specific
alias power4='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab4 --device host --action cycle'
alias power12='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab12 --device host --action cycle'
alias power30='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab30 --device host --action cycle'
alias power32='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab32 --device host --action cycle'
alias power36='python3 ~/code/digital/test/pydrive/tools/power_ctrl.py --machinename lab36 --device host --action cycle'

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

