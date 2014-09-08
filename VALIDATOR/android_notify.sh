set +e
use commander
use indicator
use disown1

file=/usr/share/android-notifier-desktop/run.sh 
cmd="$file -i | grep -v not" 
commander $cmd
res=$?

if [ $res -ne 0 ];then
 commander  disown1 "$file"
fi
indicator
print color 33 "[ CONNECTIONS ]"
netstat -lantp | grep ESTABLISHED |awk '{print $5}' | awk -F: '{print $1}' |  sort -u  
