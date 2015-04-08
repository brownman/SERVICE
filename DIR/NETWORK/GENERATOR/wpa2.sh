set -o nounset
use cat1
source *.cfg
source *.1st
run(){
local file=/tmp/wpa0
local ssid=Linnovate
local key=linnotng
local cmd="sudo wpa_passphrase $ssid $key"
echo $cmd
commander "$cmd" | tee $file
commander ls -l $file
commander cat $file 

cat $file | grep 'psk' | grep -v '\#' | cut -d'=' -f2
#commander mv "$file" "$dir_profile/"
#commander "cat1 $dir_profile/$filename true"
}
run 
