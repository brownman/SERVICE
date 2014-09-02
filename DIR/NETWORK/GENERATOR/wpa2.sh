set -o nounset
run(){
local file=/tmp/wpa0
local cmd="sudo wpa_passphrase $ssid $key"
echo $cmd
eval "$cmd" | tee $file
cat1 $file true

cat $file | grep 'psk' | grep -v '\#' | cut -d'=' -f2
#commander mv "$file" "$dir_profile/"
#commander "cat1 $dir_profile/$filename true"
}
run $1
