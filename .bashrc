#
# ~/.bashrc
#

# If not running interactively, don't do anything
export TERM=xterm-256color
[[ $- != *i* ]] && return

if [[ $(tty) == "/dev/tty1" ]]; then
    clear
    echo " Welcome to abdeldjalile's Personal Development Environment"
    sleep 5
    exec Hyprland
fi

source /home/jalil-lafkir/config.sh
PS1='\u@192.168.420.69 \[\e[38;2;77;128;228m\]${PWD/#$HOME/~}  \[\e[0m\]% '























if [[ -f /home/jalil-lafkir/me.files/configs/Scripts/personal-machine-banner.sh ]]; then
    source /home/jalil-lafkir/me.files/configs/Scripts/personal-machine-banner.sh
else
    echo "Welcome to your personal machine!"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

#PUBLIC_IP=$(curl -s --max-time 2 ifconfig.me)
#[ -z "$PUBLIC_IP" ] && PUBLIC_IP="192.168.420.69"


#PS1='[\u@\h \W]\$ '
#PS1='\u@\h \[\e[38;2;77;128;228m\]${PWD/#$HOME/~}  \[\e[0m\]% '
#PS1='\u@'"$PUBLIC_IP"' \[\e[38;2;77;128;228m\]${PWD/#$HOME/~}  \[\e[0m\]% '


