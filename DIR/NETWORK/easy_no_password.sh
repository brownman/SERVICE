
source /tmp/library.cfg
$cmd_trap_err
source *.cfg
source *.1st
export ssid=NAAN-229F
#./SOLUTION/wlan0.sh


commander use_ssid 229F
commander ./GENERATOR/wpa2.sh
commander ./SOLUTION/rf_kill.sh
commander ./SOLUTION/wpa2.sh


