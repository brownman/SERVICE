set +e
file=/usr/share/android-notifier-desktop/run.sh 
cmd="$file -i | grep -v not" 
commander $cmd
res=$?

if [ $res -ne 0 ];then
 commander  disown1 "$file"
fi
indicator
