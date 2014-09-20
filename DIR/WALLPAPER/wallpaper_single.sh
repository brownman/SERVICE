#!/bin/bash
#note: colors: red,green,yellow,blue,magenta,cyan,black,white.

set +x
set -o nounset
use where_am_i
use print
use assert
use commander
use dialog_optional

pid_exist(){
  local res
  local str="$1"
  print func
  ( ps -aux | grep "$str" &>/dev/null )
  res=$?
  return $res
}


set_env(){
  export dir_self=`where_am_i $0`
  export dir_bank="$dir_self"
  export dir_conf="$dir_bank/CONF"
  export dir_sh="$dir_bank/SH"
}

intro(){
  print color 34 $dir_conf
  ls -1 $dir_conf
  echo
  print color 35 $dir_sh
  ls -1 $dir_sh
}

generate_txt(){
  print func
  local cmd file_script

  file_script="$dir_sh/${option}.sh" 
  #cat1 $file_script true
  if [ -f "$file_script" ];then
    cmd="source $file_script"
    file_out=/tmp/${option}
    commander "$cmd" 1>$file_out
    assert file_exist $file_out
    #cat1 $file_out
  else
    print warning "no generator: $file_script"
    dialog_yes_no 'y/n' 'create new .sh file ?' && ( gvim -f $file_script )
    chmod u+x $file_script
  fi
}

print_to_screen(){
  print func
  local file="$dir_conf/${option}.conf"

  # hotkey_update "gvim $file"
  local filename=$( basename $file )
  dialog_recent "edit $filename" "gvim $file"
  local cmd="conky -c $file -x $x -y $y -p $p"
  local str
  if [ ! -f "$file" ];then
    print color 33 '[WARNING] no configuration--> generating new '
    cp $dir_conf/default.conf $file
    str0="\${font Ubuntu:size=20}${option}\$font"
    echo "$str0" >> $file
    str="\${exec cat /tmp/$option}"
    echo "$str" >> $file
  fi
  commander "$cmd"  &>/dev/null &
}

steps(){
  set_env
  use cat1
  generate_txt && print_to_screen
}

cmd_trap_err='trap trap_err ERR'
eval "$cmd_trap_err"

if [ $# -gt 0 ];then
  if [ "$1" = kill ];then
    ( pid_exist conky ) && (    killall conky  ) || { print color 33 'no conky instances'; }
  else 
    assert left_bigger $# 0
    option="$1"
    x="${2:-0}"
    y="${3:-0}"
    p="${4:-0}"
    #shift
    #args=${@:-}
    trace "[OPTION] $option"
    (     steps )

  fi
else
  set_env
  intro
fi

