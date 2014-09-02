set -o nounset
set -x
set -e
file=/tmp/interfaces
dir=/etc/network
ensure dir_exist $dir
file_target=$dir/interfaces

cat > $file << FILE
auto $device
iface $device inet dhcp 
wpa-ssid $ssid
wpa-psk  $psk
FILE
cat1 $file
commander "sudo cp $file $file_target"
#After that write and close file and use command:
commander "sudo dhclient $device" #uses $file

