#num=11
  #adb remount                  - remounts the /system partition on the device   read-write

use commander
use cat1
use assert

set -u
file_tmp=/tmp/arp
#$( mktemp ) 

network_arp(){
#  http://www.commandlinefu.com/commands/matching/arp/YXJw/sort-by-votes
  #nmap -sP 192.168.1.0/24; arp -n  | grep "192.168.1.[0-9]* *ether" | cut -d' ' -f1 >$file_tmp

  #ignore gateway: X.X.1.1
  arp |  sed -n '1!p' | cut -d' ' -f1  | grep -v '1.1$'   > $file_tmp 
  cat1 $file_tmp true
}
#cat1 $file_tmp false
adb_connect(){
  local ip="$1"
  #assert string_has_content "$ip"
  commander adb connect  "$ip"
  commander adb devices
}
init(){
  while read  line;do
    commander   adb_connect $line 
  done <$file_tmp
}
network_arp
init


adb emu ls

adb shell 
