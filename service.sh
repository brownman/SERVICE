#!/bin/bash
#env clean
#http://unix.stackexchange.com/questions/98829/how-to-start-a-script-with-clean-environment
#use locking: lock, task run, unlock
source /tmp/library.cfg
use print 
print ok 
#$cmd_trap_err
#$cmd_trap_exit
dir_self="$( where_am_i $0)"
print color 33 dir_self $dir_self
#pushd "$dir_self" >/dev/null


log(){
  local line1="$(date +%H:%M) : ${line[0]}"
  echo "$line1"  >> /tmp/service
}



clear(){
  print func
  $str_caller
}

exiting(){
  echo "[exiting]"
  commander $str_caller
  exiting0
}


activate_library(){
  local file_lib=/tmp/library.cfg
  if [ -f "$file_lib" ];then
    source $file_lib
  else
    echo 1>&2 "[ ERROR ] install the library first"
    exiting 1
  fi
  test -v dir_library || { exiting 1; }
  test -v dir_CODE || { exiting 1; }
  #test -v dir_CODE_BLAA || { exiting 1; }
}

set_env(){
  set -u
  export dir_SERVICE="$dir_self"
  export dir_SH="$dir_SERVICE/SH"
  export dir_VALIDATOR="$dir_SERVICE/VALIDATOR"
  export dir_LIST="$dir_SERVICE/LIST"
}

intro_start(){
  #    echo "[dir_SERVICE] $dir_SERVICE"
  test -v dir_VALIDATOR || { exiting1; }
  print func
  print ok Genius You
  echo
  print color 35 AVAILABLE VALIDATORS
  nl < <( ls -1 $dir_VALIDATOR )
  echo
  print color 33 AVAILABLE SCRIPTS
  nl < <( ls -1 $dir_SH )
}

stepper_run(){
  set -u
  local runner=${line[0]}
  args=''
  if [ "${#line[@]}" -gt 1 ];then
  args="${line[@]:1}"
  fi

  local file_script="$dir_VALIDATOR/${runner}.sh"
  local cmd="$file_script $args"
  if [ -f "$file_script" ];then
    commander "$cmd" 
  else
    print error "no such file: $file_script"
    notify-send1 $0 "no such file: $file_script"
  fi
}
ensure(){
  #install_symlink_to_hotkey
  #install_symlink_to_service
  echo
}

using1(){
  #  ls /tmp/library.cfg
  #source /tmp/library_proto.cfg
  use indicator 
  use vars
  use notify-send1
  use assert
  use where_am_i
  use ps1 
  use ps4
  use commander
}

testing(){

  using1
  set_env

#commander lock true false 

#commander lock true false 
##

}

stepper_init(){
  if [ "$MODE_TEST" = true ];then
    print color 35 MODE_TEST is on
    testing
  else
    if [ ${#line[@]} -ne 0  ];then
#echo commander lock true false 
log
      stepper_run 
#echo commander lock false true  
    else
      print color 33  "no arguments" "$0"
      notify-send1 "no arguments" "$0"
    fi
  fi
}


steps(){
  using1
  set_env
  intro_start
  stepper_init
}

print_env(){
  echo env
  env
}

readonly line=( $@ )

testing && steps



#popd >/dev/null
