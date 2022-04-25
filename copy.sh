#!/usr/bin/env bash
echo "••• COPYING FILES... •••"
if [[ "$OHOME" != "" ]]; then HOME="$OHOME"; fi
copy(){
    if [[ "$2" == "" ]]; then
        nf="$1"
    else
        nf="$2"
    fi
    echo " `tput setaf 10`$1   `tput setaf 8`COPYING...`tput sgr0`"
    cp $1 $HOME/Documents/PRVim/$nf
}
copymod(){
    f="$1"
    cp $f .copied_$f
    vim .copied_$f
    copy .copied_$f $f
    rm .copied_$f
}
ignoremsg(){
    echo " `tput setaf 3`$1   `tput setaf 8`IGNORED.`tput sgr0`"
}
echo "`tput setaf 3``tput bold`WARN:`tput setaf 3` If you see any messages with 'IGNORED' text but you want to copy ignored files, run program again with --full parameter or --other-modify parameter."
if [[ "$1" == "--full" ]]; then
    copy .bashrc
elif [[ "$1" == "--other-modify" ]]; then
    copymod .bashrc
else
    ignoremsg .bashrc
    copy .bashrc .bashrc_virtualenv
fi
copy .vimrc
for file in `ls`; do
    copy $file
done
echo "••• ...COPYING FILES •••"
echo "Files copied. If you see any errors, please check the permissions, your shell functions&aliases and any malware is on your computer."
