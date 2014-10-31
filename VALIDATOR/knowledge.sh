#http://www.slideshare.net/
#http://github.com/brownman/scrapping
#http://wordpress-ex01.rhcloud.com/wp-admin/post.php?post=17&action=edit
#http://wordpress-ex01.rhcloud.com/wp-admin/post.php?post=20&action=edit
#http://www.goethe-verlag.com/book2/EM/
#http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM

set -u
use dialog_sleep
use dialog_menu
use point
use_sh awake
use flite1

url_pick(){
 # while read line;do
 local file_tmp=`mktemp`
 cat $0 | grep '#http://' | grep -v grep | sed 's/\#//g'  > $file_tmp
 local line=$( dialog_menu_echo $file_tmp )
 commander   open_with "$line"
}

url_pick
