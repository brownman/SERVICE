#!/bin/bash
#env clean
#http://unix.stackexchange.com/questions/98829/how-to-start-a-script-with-clean-environment
#use locking: lock, task run, unlock
set -u
set -e
#$cmd_trap_err
#$cmd_trap_exit
test -f /tmp/library.cfg || { echo 1>&2 install  the library first; exit 0; }

source /tmp/library.cfg
dir_self="$( where_am_i $0)"
print color 33 dir_self $dir_self
#pushd "$dir_self" >/dev/null
crontab_update(){


commander   time_update
assert var_exist time_secs

  local file=$dir_self/crontab.txt
#  commander cat1 $file true
commander gvim -f $dir_self; 
  dialog_optional  'override crontab ?' && ( 
  commander  "crontab -l > /tmp/crontab.bak.$time_secs"
  commander crontab $file 
commander  crontab -l
  )
}

log(){
  use ensure
  use file_update

  print func
  local line_readonly0="$@" 
  local line_readonly1="$(date +%H:%M) : $line_readonly0"
  #  echo "$line_readonly1"  >> /tmp/service

  commander ensure touch /tmp/service
  assert file_exist /tmp/service
  file_update /tmp/service "$line_readonly1"
  print ok $line_readonly1
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
  local runner=${line_readonly[0]}
  args=''
  if [ "${#line_readonly[@]}" -gt 1 ];then
    args="${line_readonly[@]:1}"
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
    if [ ${#line_readonly[@]} -ne 0  ];then
      #echo commander lock true false 
      log "run service: ${line_readonly[0]}"
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
let num_random=12
use random
random $num_random && ( dialog_yes_no 'upgrade productivity ?' && ( crontab_update  ))
readonly line_readonly=( $@ )

testing && steps



#popd >/dev/null
