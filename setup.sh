#!/bin/bash - 
#===============================================================================
#
#          FILE: setup.sh
# 
#         USAGE: ./setup.sh 
# 
#   DESCRIPTION: Setup PRVim on your computer
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Olafcio
#  ORGANIZATION: 
#       CREATED: 04/26/2022 12:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
version="0.5"

echo '
 _____  _______      ___           
 |  __ \|  __ \ \    / (_)          
 | |__) | |__) \ \  / / _ _ __ ___  
 | |___/|  _  / \ \/ / | | |_ ` _ \ 
 | |    | | \ \  \  /  | | | | | | |
 |_|    |_|  \_\  \/   |_|_| |_| |_|

'
info(){
    echo " `tput setaf 7`$@`tput sgr0`"
}
warn(){
    echo "`tput setaf 3``tput bold`WARN: `tput setaf 7`$@`tput sgr0`"
}
error(){
    echo "`tput setaf 1``tput bold`ERROR: `tput setaf 7`$@`tput sgr0`"
}
info "Checking you have arleady installed PRVim..."
if [[ ! -d "$HOME/.prvim" ]]; then
    info "PRVim is not installed; installing..."
elif [[ -d "$HOME/.prvim" && -f "$HOME/.prvim/installed" ]]; then
    if [[ "`cat $HOME/.prvim/installed`" == "$version" ]]; then
        info "PRVim is arleady installed; reinstalling..."
    elif [[ "`cat $HOME/.prvim/installed`" -lt "$version" ]]; then
        info "PRVim is arleady installed; updating..."
    elif [[ "`cat $HOME/.prvim/installed`" -gt "$version" ]]; then
        warn "PRVim is arleady installed on your computer with newer version than this installer is about to install."
        echo -n "Do you want to anyway install older version [y/N]? "
        read tmp
        tmp="$(echo \"$tmp\" | tr '[:upper:]' '[:lower:]')"
        case $tmp in
            "y" | "yes") echo "Ok, installing..." ;;
            "n" | "no") echo "Ok, cancelling."; exit ;;
            *) echo "Another answer received than y/yes or n/no; exiting."; exit 1
        esac
    fi
elif [[ -d "$HOME/.prvim" && ! -f "$HOME/.prvim/installed" ]]; then
    info "Your PRVim installation is corrupted; installing..."
fi
mkdir /tmp/.prvim; cd /tmp/.prvim
git clone https://github.com/Olafcio1/PRVim; cd PRVim
echo -n "Install PRVim on your account, or in virtual environment [a/v]? "
read tmp
tmp="$(echo \"$tmp\" | tr '[:upper:]' '[:lower:]')"
case $tmp in
    "a"*) echo "Ok, installing on your account...";
        if [[ -f "$HOME/.vimrc" ]]; then
            echo -n "Do you want to override your .vimrc [y/N]? "
            read tmp
            tmp="$(echo \"$tmp\" | tr '[:upper:]' '[:lower:]')"
            case $tmp in
                "y" | "yes") echo "Ok, overriding..." ;;
                "n" | "no") echo "Ok, cancelling."; exit ;;
                *) echo "Another answer received than y/yes or n/no; exiting."; exit 1
            esac
        fi
        cp ./.vimrc $HOME/.vimrc
        if [[ ! -d "$HOME/.vim" ]]; then
        	mkdir $HOME/.vim
		fi
        cp ./coc-settings.json $HOME/.vim/coc-settings.json
    ;;
    "v"*) echo "Ok, installing on virtual environment...";
        echo -n "Virtual environment path: "
        read path
        cp ./.vimrc $path/.vimrc
        if [[ ! -d "$HOME/.vim" ]]; then
        	mkdir $HOME/.vim
		fi
        cp ./coc-settings.json $HOME/.vim/coc-settings.json
        cp ./.bashrc_virtualenv $path/.bashrc
        vim $path/.bashrc
        echo -n "Do you want to launch created virtual environment now [Y/n]? "
        read tmp
        tmp="$(echo \"$tmp\" | tr '[:upper:]' '[:lower:]')"
        case $tmp in
            "y" | "yes") echo "Ok, launching..." ;;
            "n" | "no") echo "Ok."; cd $path; bash --rcfile ./.bashrc ;;
            *) echo "Another answer received than y/yes or n/no; exiting."; exit 1
        esac
    ;;
    *) echo "Another answer received than a/v; exiting."; exit 1
esac
echo "PRVim setup done installing PRVim succesfully."
