
msg='time is ...'
notify-send "$msg" &
#flite -t  "$msg" 
sleep 3
xcowsay `date +"%H:%M"`
