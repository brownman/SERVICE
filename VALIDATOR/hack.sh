args1=$1
interface=wlan0
arp1(){
sudo arp -a
}
sniff(){
commander sudo airmon-ng start $interface
commander sudo airmon-ng | grep mon0
commander sudo iwconfig | grep Mode:Monitor
}
help(){
sudo lsmod | grep 80211
sudo airmon-ng | grep $interface
}
echo hi

commander $args1
