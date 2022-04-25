# This .bashrc is an example bash config file to make Vim auto-start NERDTree on launch.
# And, "vimupdate" alias (vim +PlugInstall).

# If you have Git Bash then uncomment it: HOME="/c/Users/`whoami`/.gb"; export HOME
BLUEbg="`tput setab 4``tput bold`"
YELLOWbg="`tput setab 3``tput bold`"
YELLOWtt="`tput setaf 3``tput bold`"
BLACKtt="`tput setaf 8``tput bold`"
RESET="`tput sgr0`"
PS1="\[$BLUEbg\]\[$YELLOWtt\]`whoami`\[$YELLOWbg\]\[$BLACKtt\]\w\[$RESET\]$ "
function vim(){
    if [[ "$1" == "" ]]; then
        /usr/bin/vim
    elif [[ "$1" != "" && "$1" != "+PlugInstall" ]]; then
        /usr/bin/vim +NERDTreeToggle $@
    fi
}
alias vimupdate="/usr/bin/vim +PlugInstall"
clear
