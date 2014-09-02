#!/bin/bash
clear
set -o nounset

str_caller='$(eval echo caller)'
gxmessage1='gxmessage -file /tmp/err'
MODE_TEST=false
cmd_trap_err='trap trap_err_service ERR'
#trap trap_exit_service EXIT
#$cmd_trap_err


exec 2> >(tee /tmp/err >&2)

clear(){
  $str_caller
}

exiting(){
  echo "[exiting]"
  commander $str_caller
  exit 0
}

install_symlink_to_hotkey(){
  if [ ! -f /tmp/hotkey.sh ] ;then
    ln -s "$dir_SERVICE/SH/hotkey.sh" /tmp
  fi
  [ ! -f /tmp/hotkey.txt ] || ( rm /tmp/hotkey.txt )
}


install_symlink_to_service(){
  if [ ! -f /tmp/service.sh ];then
    echo install symlink first
    #rm /tmp/service.sh
    #commander ln_to_tmp "`who_am_i $0`"
    #dir_SERVICE=$PWD
    local filename=`basename $0`
    file_self=$dir_SERVICE/$filename
    ln -s $file_self /tmp
  else
    echo 1>&2 anchor already installed: /tmp/service.sh
  fi
}

activate_library(){
  #$cmd_trap_err
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

where_am_i () 
{ 
  local file=${1:-"${BASH_SOURCE[1]}"};
  local rpath=$(readlink -m $file);
  local rcommand=${rpath##*/};
  local str_res=${rpath%/*};
  local dir_SERVICE="$( cd $str_res  && pwd )";
  echo "$dir_SERVICE"
}

trap_exit_service(){
  echo ------
  echo $FUNCNAME
  echo "[CALLER] `caller`"
}

trap_err_service(){
  xcowsay error
  use print
  print func
  local str_caller="`caller`" 
  local cmd="gvim  +${str_caller}"
  $( gxmessage -file /tmp/err -entrytext "$cmd" ) &
  exiting 0
}


set_env(){
#$cmd_trap_err
set -u

  #test -v dir_CODEblah || { exiting 1; }
  dir_self="$( where_am_i )"

  export dir_SERVICE="$dir_self"
  export dir_SH="$dir_SERVICE/SH"
  export dir_STEPPER="$dir_SERVICE/STEPPER"
  export dir_LIST="$dir_SERVICE/LIST"
}

intro_start(){
  #    echo "[dir_SERVICE] $dir_SERVICE"
  test -v dir_STEPPER || { exit 1; }
  print func
  print ok Genius You
  echo
  print color 35 AVAILABLE STEPPERS
  nl < <( ls -1 $dir_STEPPER )
  echo
print color 33 AVAILABLE SCRIPTS
  nl < <( ls -1 $dir_SH )
}

stepper_run(){
  set -u
  local runner="$1"
  shift
  local args="${@:-}"
  local cmd
  local file="$dir_STEPPER/${runner}.sh"
  if [ -f "$file" ];then
    if [ "${args[@]}" = edit ];then
      cmd="gvim  $file"
    else
      cmd="$file $args"
    fi
    echo "[cmd] $cmd"
    #  xcowsay "$cmd"
    eval "$cmd"
  else
    notify-send "no such file: $file" "$0"
  fi

}
ensure(){
  install_symlink_to_hotkey
  install_symlink_to_service
}

using1(){
  #  ls /tmp/library.cfg
  source /tmp/library.cfg
  use indicator 
  use ps1 
  use ps4
  use commander
  indicator 0
}
testing(){
  intro_start
  use assert
  assert var_exist dir_STEPPER
  assert dir_exist "$dir_STEPPER"
}

#passed
#set -e
#exit
stepper_init(){
  #  pushd `dirname $0`>/dev/null
  if [ "$MODE_TEST" = true ];then
    print color 35 MODE_TEST is on
  else
    if [ -n "$cmd_start"  ];then
      commander stepper_run $cmd_start
    else
      notify-send "no arguments" "$0"
    fi
  fi
  #  popd >/dev/null
}


steps(){
  set_env
  install_symlink_to_service
  activate_library
  using1
  intro_start
commander   stepper_init 
  #$cmd_trap_err
  #  ensure
  #  intro_start
}
cmd_start="${@:-}"
steps
