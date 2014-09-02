set -o nounset
use commander force
commander sudo ifconfig $device up
commander sudo iw dev $device connect $ssid
commander sudo dhcpcd $device

