alias git_add_mod="git status | grep modified: | cut -d ' ' -f4- | xargs git add"
