wmctrl -l > /tmp/wmctrl
use dialog_menu
str=$(gxmessage -file /tmp/wmctrl -entry $GXMESSAGE )
commander wmctrl -a $str
