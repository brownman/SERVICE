#  http://www.commandlinefu.com/commands/matching/arp/YXJw/sort-by-votes
clear
#echo $@
exec -c
source /tmp/library.cfg
use cat1
use assert
use commander
use indicator
use disown1
use print

set +e
set -u

#network_arp
arps(){
file_tmp=/tmp/arp
arp |  sed -n '1!p' | cut -d' ' -f1  | grep -v '1.1$'   > $file_tmp 
cat1 $file_tmp true
}

notifier1(){
local   file=/usr/share/android-notifier-desktop/run.sh 
local   cmd="$file -i | grep -v not" 
  commander $cmd
local   res=$?
  if [ $res -ne 0 ];then
    commander  disown1 "$file"
  fi
  indicator
  print color 33 "[ CONNECTIONS ]"
  netstat -lantp | grep ESTABLISHED |awk '{print $5}' | awk -F: '{print $1}' |  sort -u  
}

ssh1(){
  port=35991
  ip=192.168.1.4
  user=dao04
  folder='/mnt'
  service1=ssh
  service2=sftp


echo commander  "$service1 $user@$ip -p $port"
commander thunar "$service2://$ip:$port/$folder"
}

adb1(){
  arps
  while read  line;do
    commander adb connect  "$ip"
  done <$file_tmp
  commander adb devices
  #eval $(history | cut -c 8- | grep Ã¤db connect [0-9]" | tail -1)
  echo adb emu ls
  echo adb shell 
}

assert left_bigger $# 0
cmd=${1:-nothing}
assert func_exist "$cmd"
commander "$cmd"
