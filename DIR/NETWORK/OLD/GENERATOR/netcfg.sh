set -o nounset
set +e
file=/tmp/netcfg
rm1 $file
cat > $file << FILE
CONNECTION='wireless'
DESCRIPTION='A simple WPA encrypted wireless connection'
INTERFACE=$device
SECURITY=$encryption

ESSID=$ssid
## Uncomment if the supplied ESSID is hexadecimal
#ESSID_TYPE='hex'
KEY=$key

IP='dhcp' 
FILE
assert file_exist $file
# Uncomment this if your ssid is hidden
#HIDDEN=yes
cat1 $file
commander "sudo cp $file $IFACE_DIR/$profile_name"
commander "sudo netcfg $profile_name"
