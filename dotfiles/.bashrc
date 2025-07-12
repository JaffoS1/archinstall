#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\[\e[38;5;179m\][\u\[\e[38;5;8m\]@\[\e[38;5;179m\]\h] \[\e[38;5;7m\][\W] \[\033[0m\]"

LS_COLORS=$LS_COLORS:'di=1;38;5;179:' ; export LS_COLORS
alias fastfetch='fastfetch -l small'
alias packy='sudo pacman -Syu'
alias bye='sudo shutdown now'
alias knebel='streamlink -p mpv https://www.twitch.tv/knebeltv best'
alias mhz='watch -n1 "grep Hz /proc/cpuinfo"'
alias wetter='curl wttr.in/Bremen?format="%l:\n%c%t\n%p\n%w\n%P\n"'
alias chat='twt'
alias lf='ranger'
alias rec='ffmpeg -y -s 1920x1080 -f x11grab -framerate 60 -i :0.0+0,1080 -f pulse -i alsa_output.usb-Yamaha_Corporation_AG06_AG03-00.analog-stereo.monitor -c:v h264_nvenc -preset p3 -rc vbr -b:v 15M -maxrate 20M -bufsize 25M -pix_fmt yuv420p -c:a aac -b:a 192k /home/jaffo/Downloads/vid.mp4'
alias scs='ffmpeg -y -s 2560x1440 -f x11grab -i :0.0+0,1080 -frames:v 1  /home/jaffo/Downloads/screen.jpg'

PATH=$PATH:~/.cargo/bin/
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/sbin
