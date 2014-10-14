
run1(){
#local file=$dir_workspace/game.txt
#ensure touch $file
#test -f $file || ( gvim -f $file )

use dialog_menu
use open_with
#hotkey_override "update games" "gvim -f $file"
#echo `random_line $file`

/tmp/pilot.sh GAME
#local str=$( commander dialog_menu_multiple $file )
#dialog_optional open? "open_with $str"
#commander open_with $str
}

run1

