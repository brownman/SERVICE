clear
offset=19
cmd="sudo iwlist $device scan"
file=/tmp/iwlist
commander "$cmd" | tee $file

cat -n  $file | grep $ssid -B 5 -A $offset > /tmp/res0

cat1 /tmp/res0

grep_color
cat1 /tmp/res0 | egrep -h Channel\|ESSID\|Auth\|Cipher\|Adress\|Mode\|802\|Address --color=auto
