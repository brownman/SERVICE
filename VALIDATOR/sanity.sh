source /tmp/library.cfg
use assert
use commander
set -u
file=/tmp/dir_root/SCRIPT/PROTOTYPES/BANK/sanity_loop/run.sh
commander assert file_exist "$file"
commander_lock_file  $file sanity

