#utilze: "$dir_profile/wpa0"
#GENERATOR/generate_wpa_profile.sh

set -o nounset
set +e
echo wish: 
echo Successfully initialized wpa_supplicant
#echo example: wpa_supplicant -Dnl80211 -iwlan0 -c/etc/wpa_supplicant.conf

#file="/tmp/wpa0" # generated by generate_wpa_profile.sh 

#$dir_parent/GENERATOR/wpa2.sh
file="/tmp/wpa0"
#assert file_exist "$file"
device=wlan0
commander "sudo wpa_supplicant  -D$driver -i$device -c$file" 
commander sudo dhclient $device #get ip address
commander cat /etc/resolv.conf
commander ping1
