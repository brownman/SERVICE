#url: https://bbs.archlinux.org/viewtopic.php?id=156074
#note: I never did "ip link set $device up" nor ran dhcpcd.
set -o nounset

file=/tmp/wpa
cat > $file << FILE
update_config=1
ap_scan=2
ctrl_interface=/var/run/wpa_supplicant

network={
mode=0
scan_ssid=1
proto=WPA2
key_mgmt=WPA-PSK
pairwise=CCMP
group=CCMP
bssid=$mac_ssid
ssid=$ssid
psk=$psk
}
FILE
grep_color
cat1 $file | egrep -h bssid\|ssid\|psk\|mode --color=auto
#file_target=/etc/wpa_supplicant/wpa_supplicant.conf
#assert file_exist $file_traget
#cp $file $file_target

