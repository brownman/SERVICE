#!/bin/bash
#env clean
#http://unix.stackexchange.com/questions/98829/how-to-start-a-script-with-clean-environment
#use locking: lock, task run, unlock
set -u
#set -e
#set -x
#$cmd_trap_exit
test -L /tmp/library.cfg || { echo 1>&2 install  the library first; exit 0; }

source /tmp/library.cfg
export file_log=/tmp/service.log

#$cmd_trap_err
dir_self="$( where_am_i $0)"
print color 33 dir_self $dir_self
#pushd "$dir_self" >/dev/null
log123(){

  print func
  local line_readonly0="$@" 
  local line_readonly1="$(date +%H:%M:%S) : $line_readonly0"
  
  #  echo "$line_readonly1"  >> /tmp/service
#notify-send 'log' "${line_readonly1}" &
  touch $file_log
  #/tmp/service
  file_update $file_log "$line_readonly1"
  print ok $line_readonly1
commander   sleep 1
}



clear(){
  print func
  $str_caller
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

  export dir_DIR="$dir_SERVICE/DIR"
  export dir_LIST="$dir_SERVICE/LIST"
  export dir_PROTOTYPTE="/tmp/dir_root/SCRIPT/prototypes/BANK"
}

intro_start(){
  #    echo "[dir_SERVICE] $dir_SERVICE"
  test -v dir_VALIDATOR || { exiting; }
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
#    dialog_recent "task: $runner" "gvim $file_script"
    
   cat1 $file_script true
     sleep 2

    #notify-send1 "$0" "running: $file_script" &
    print line
trace "$cmd"
eval "$cmd" 1>/tmp/$runner.out 2>/tmp/$runner.err || ( xcowsay "`cat /tmp/$runner.err`" )
  else
    print error "no such file: $file_script"
    notify-send1 "$0" "no such file: $file_script" &
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

    use commander_gxmessage
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
      log123 "run service: ${line_readonly[0]}"
      stepper_run 
      #echo commander lock false true  
    else
      print color 33  "no arguments" "$0"
      notify-send1 "no arguments" "$0" &
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

display_help(){
  using1
  set_env
  intro_start

}  # Call your function

while getopts ":e:" opt; do

  #http://wiki.bash-hackers.org/scripting/posparams
  case $opt in
    -h | --help)
      display_help
      # no shifting needed here, we're done.
      exit 0
      ;;
    -v | --verbose)
      set -e;
      set -x;
      ;; 
    e)
      echo "-e was triggered, Parameter: $OPTARG" >&2
     commander sleep 4 

      file=/tmp/dir_root/SCRIPT/SERVICE/VALIDATOR/${OPTARG}.sh
#      commander "assert file_exist $file"
test -f $file && (     cat1 $file true; dialog_optional_edit $file  ) || (
      $EDITOR -f $file
      chmod u+x $file
      )

      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo no params


#
#set ${@:}"This is" my new ÃŸet of" positional parameters

      #sleep 2

      ;;
  esac
done

#hotkey_overide /tmp/service.sh crontab
line_readonly=( $@ )
testing && steps







#popd >/dev/null
