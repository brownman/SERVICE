#xdg-open "http://bash.cyberciti.biz/guide/Main_Page"
set -x
( random 10 )
res=$?
let "num = $res + 1"

line="http://bash.cyberciti.biz/guide/Chapter_${num}_Challenges"

#wmctrl -a "$line" || { 
commander xdg-open "$line"
#}


