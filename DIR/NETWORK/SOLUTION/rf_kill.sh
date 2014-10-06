#SIOCSIFFLAGS: Operation not possible due to RF-kill
use grep_color

echo reproduce:
ifconfig_down

grep_color
#SIOCSIWSCAN
ifconfig_up | grep  SIOCSIFFLAGS --color=always

sudo rfkill list | grep yes --color=auto
commander 'sudo rfkill unblock all'

