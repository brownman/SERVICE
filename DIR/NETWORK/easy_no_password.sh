
source /tmp/library.cfg
#$cmd_trap_err
use indicator
use commander
source *.cfg
source *.1st
export ssid=Linnovate
#NAAN-229F
#./SOLUTION/wlan0.sh


commander use_ssid $ssid
commander ./GENERATOR/wpa2.sh
commander ./SOLUTION/rf_kill.sh
commander ./SOLUTION/wpa2.sh


