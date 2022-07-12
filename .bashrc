# This .bashrc is an example bash config file to make Vim auto-start NERDTree on launch.
# And, "vimupdate" alias (vim +PlugInstall).

# If you want to have virtual environment for PRVim on Git Bash:    HOME="/c/Users/`whoami`/.gb"; export HOME
# If you want to have virtual environment for PRVim on Linux/macOS: HOME="(path of your virtual environment)"; export HOME
BLUEbg="`tput setab 4``tput bold`"
YELLOWbg="`tput setab 3``tput bold`"
YELLOWtt="`tput setaf 3``tput bold`"
BLACKtt="`tput setaf 8``tput bold`"
RESET="`tput sgr0`"
PS1="\[$BLUEbg\]\[$YELLOWtt\]`whoami`\[$YELLOWbg\]\[$BLACKtt\]\w\[$RESET\]$ "
PATH="$PATH:/c/Users/olafc/Downloads/ctags58/ctags58"
clear
