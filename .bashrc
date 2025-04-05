#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $(tty) == "/dev/tty1" ]]; then
       echo "";
       echo "Starting hyprland Session ... ";
       sleep 5
       Hyprland
fi

#PS1='[\u@\h \W]\$ '
#PS1='\u@\h \[\e[38;2;77;128;228m\]${PWD/#$HOME/~}  \[\e[0m\]% '
PS1='\u@192.168.420.69 \[\e[38;2;77;128;228m\]${PWD/#$HOME/~}  \[\e[0m\]% '




