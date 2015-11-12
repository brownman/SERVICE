

msg='whats the time now  ?... ...'
notify-send "$msg" &
#flite -t  "$msg" 
sleep 6
let num=`date +"%M"`
let num=$num/15
let num+=1
str="${num}/4"
xcowsay "ehud $str"


