#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
alias synergy_start='synergyc erikh-linux'
alias ssh_work='ssh erik@10.220.233.85'
export PATH=/Users/erik.habbinga/sbt/bin:$HOME/Library/Haskell/bin:$PATH
