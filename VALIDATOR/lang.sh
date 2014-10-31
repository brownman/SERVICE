#xcowsay lang
#return 
lang=${1:-IT}
dir=$HOME/Downloads/LEARN_LANG/$lang
( wmctrl -a vlc ) || (vlc $dir/*.mp3 )
xdotool key p
