set -o nounset
set -x
set -e
clear
trap_err(){
echo "caller `caller`"
echo $?
exit
}

 forever(){                       
 sudo systemctl reenable netctl.service 
 sudo systemctl reenable netctl.service 

 file1='/usr/lib/systemd/system/netctl.service' 
 file2='/etc/systemd/system/multi-user.target.wants/netctl.service'
sudo ln -sf $file1 $file2


#enable the service
commander "sudo netctl enable wlp5s0-linksys"
commander "sudo systemctl reenable netctl.service"
}
info1(){
cat  '/usr/lib/systemd/system/netctl.service'
echo '/etc/systemd/system/multi-user.target.wants/' 

ls -l '/etc/systemd/system/multi-user.target.wants/' 
}

actions(){
dir_self=`where_am_i $BASH_SOURCE`
iface=wlp5s0
ssid=${1:-NAAN-4C64}
#NAAN-229F
echo dir_self: $dir_self
file="$dir_self/CONF/${ssid}.dynamic"
assert file_exist "$file"

#clean
commander "ifconfig $iface down"
#ifconfig $iface up
commander "netctl stop-all"

#options
#netctl list
#sleep 3
commander "netctl -o $file"
commander "netctl restart $ssid"
commander "netctl reenable"

#echo As stated before
#printf Job for netctl@NAAN\x2d229F.service failed. See 'systemctl status netctl@NAAN\x2d229F.service' and 'journalctl -xn' for details.
}
confirm(){
 ping -c 3 8.8.8.8
 ping -c 3 google.com
 }
 steps(){

trap trap_err ERR
#assert user_is_root
     
actions
 confirm
 forever
 }

 ( steps )

echo the end
