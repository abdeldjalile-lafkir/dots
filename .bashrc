#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\u@\h \[\e[38;2;77;128;228m\]${PWD/#$HOME/home/}  \[\e[0m\]% '
PS1='\u@\h \[\e[38;2;77;128;228m\]${PWD/#$HOME/~/} \[\e[0m\] % '



