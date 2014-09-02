
msg='Ofer, what is the time now ?'
notify-send "$msg" &
flite -t  "$msg" 
sleep 3
xcowsay `date +"%H:%M"`
