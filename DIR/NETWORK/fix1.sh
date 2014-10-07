source /tmp/library.cfg

use where_am_i
dir_self=`where_am_i ${BASH_SOURCE:-$0}`
export dir_parent=$dir_self

pushd $dir_self >/dev/null
#$cmd_trap_err
set -o nounset
trap - ERR
set_env(){
  use indicator
  source network.cfg
  source network_vars.1st
  SSID=229F
  commander use_ssid "$SSID"
  use assert
  type $FUNCNAME
}
intro(){
  echo SOLUTIONS:
  print line
  ls -1 SOLUTION/
  echo
}

clear
str=${1:-}
steps(){
if [ -n "$str" ];then
  set_env
  file="SOLUTION/${str}.sh"
  assert file_exist $file
  commander $file
else
  intro
fi
}
gksudo echo hi || ( gksu echo hi )
( steps )
indicator $?



popd >/dev/null
