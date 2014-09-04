#!/bin/bash
#YAML VALIDATOR: http://yamllint.com/

set -o nounset

shopt -s expand_aliases
dir_self=.
  file_menu=$dir_self/menu.yaml
source /tmp/library.cfg
  source ~/link
use commander
use print
use assert
use cat1


broadcast1(){
  echo xcowsay "$@"
}
#info:   parse a menu which described in yaml
#depend: shyaml
#help:   use command: python1
#set -x
#env > /tmp/env
#source /tmp/env

#broadcast1 "$0"

act_on_list1 () 
{ 
  local file=$1;
  local cmd=${2:-source};
  while read line; do
    local         cmd1="$cmd $line";
    echo "$cmd1";
    eval "$cmd1"
  done < $file
}

test_type(){

  str="$1"
  trap trap_err ERR
  #set +e
  #  text="${(type $str):-$(echo $str)}"
  text=$(type $str)
  ( gxmessage "$text" )
}


#menu_roots(){
#    parse_parent_menus
#    str_res=$( dialog_menu_echo /tmp/parents )
#menu_subject "$str_res"
#}
menu_subject(){

  set -o nounset
  set +e
  trap trap_err ERR
  local menu_name="$1"

  #print ok $FUNCNAME 


  local cmd="parse_subject_menus '$menu_name'"

  commander  "$cmd"


  local  str=$( dialog_menu_multiple /tmp/subject )
  #log1 "$str"
  [ -z "$str" ]  && { print error 'got empty string';exit 0; }

  match_name "$str"
  local res=$?
  #indicator "$res"
  if [ $res -eq 1 ];then
    broadcast1 "sub-menu" &
    eval "menu_subject \"$str\""
  else

    broadcast1 "command" &
    echo "[ACTION] $str"
    #str1=$( eval \"echo $str\" )

    str1="$( echo $str )"
    # assert string_exist "$str1"
    #broadcast1 "answer: $str1"
    #eval "$str1" || trap_err

    if [ $MODE_CONFIRM = true ];then
      dialog_confirm "$str1"
    else
      echo "$str"
      local cmd_final=$( eval echo "$str" )
      dialog_confirm  "$cmd_final"
      #2>/tmp/err || ( gxmessage1 "/tmp/err" )
    fi
  fi
}
source_lib(){
  trap trap_err ERR
  #virtualenv ~/.virtualenvs/my_env
  #set +o nounset
  #source ~/.virtualenvs/my_env/bin/activate || trap_err

  #source /tmp/declare
  #source /tmp/export
  MODE=0


  trap trap_err ERR
  shopt -s expand_aliases
  alias set='echo no setting'
  alias trap='echo no trapping'

  #act_on_list1 /tmp/sourced_sh register
  #source /tmp/dirs
  #source /tmp/files
  #source /tmp/sourced_1st
  # test_type $dir_library 
  #dir_library=$dir_root/LIBRARY


  #source_list2 $dir_assets/CACHE/sourced_1st

  #    use LAYOUT layout
  #use LS source_list2
  #    use LS summary 

  #source "$dir_library/use.0st"
  #use UTIL gxmessage1


  use python1

  #source_list2     "/tmp/sourced_${str}"

  #str=1st
  # source_list2     "/tmp/sourced_${str}"


  #test_type proxy1
  #test_type python_activate
  #test_type proxy 


  set +o nounset
  #/home/paretech/.virtualenvs/my_env2.7/bin/python
  #gxmessage <<< env | grep PYTHON 

  (set +e;set +u;   commander python_activate )
  set -o nounset
  echo


  #gxmessage "$(python1)"
}

zenity1(){
  cmd="gvim +`caller`"
  eval "$cmd"
}

trap_err(){
  set +e
  broadcast1 trap err
  local str="$( caller )"
  #gxmessage "$str"

  local cmd="gvim +${str}"
  echo "$cmd"
  if [ -s /tmp/err ];then
    cat /tmp/err
    cmd=$( gxmessage -file /tmp/err -title trap_err -entrytext "$cmd" )
    echo $cmd
    eval "$cmd"
  fi
  exit 0
}


parse_parent_menus(){
  cat $file_menu | shyaml keys > /tmp/parents
}
parse_subject_menus(){
  cat $file_menu | shyaml get-value $menu_name > /tmp/subject
}
parse_record(){
  local str="$@"
  local cmd=$( cat $file_menu | shyaml get-value "$str" )
  echo "$cmd"
  #> /tmp/subject
}

update_env(){
  user_is
  exec 2> >( tee -a /tmp/err )
  exec 1> >( tee -a /tmp/out_long )
  echo
}
set_env(){
  broadcast1 $0
  set -o nounset
  #    export DISPLAY=:0

  export TERM=xterm

  broadcast1 "$0" &
  trap trap_err ERR
  broadcast1 start
  update_env
  type update_env
  source_lib
  # dir_self=`where_am_i $0`
  #pipe_point

  assert file_exist $file_menu
  #gxmessage -file "$file_menu"
  #"$file_menu"
  #dir_assets/LIST/menu.yaml"
  cat1 $file_menu

  #  type $FUNCNAME  > /tmp/out
  #   cat /tmp/out > /dev/tty2 
  #  env > /dev/tty2


}
intro(){
  broadcast1 "$time" &
  every 10 "broadcast1 \"$date_ws\"" &

  #user_is
}
validate_no_errors(){
  #[ -s /tmp/err ] && { trap_err; } || { echo no_errors; }
  print_color 33 $FUNCNAME
  ( gxmessage1 /tmp/err ) 
  ( gxmessage1 /tmp/out_long )


  #[ -s /tmp/out_out ] && { gxmessage -file /tmp/out; } || { echo no_errors; }
}

user_is(){
  #[ -f /tmp/env ]  && { mv /tmp/env /tmp/env1 ; }
  #env>/tmp/env
  #diff -d /tmp/env /tmp/env1 >/tmp/env2
  #gxmessage -file /tmp/env2
  broadcast1  $LOGNAME
  broadcast1  $0
}

steps(){
  #cleanup
  #[ -f /tmp/err ]  && { rm /tmp/err; }
  rm1 /tmp/err
  rm1 /tmp/out_long
  #source libs
  set_env
  #intro
  #detect: user is cron/hotkey/shell
  menu_subject main

  #    validate_no_errors

  #[ -f /tmp/err ]  && { broadcast1 show err; gxmessage -file /tmp/err; }

}

MODE_CONFIRM=false
if [ $# -eq 0 ];then
  (  steps)
  # menu_subject "main"
else
  #steps
  set_env
  TEST/TEST_SHYAML/test_shyaml.sh
  sleep 1
  print_line
  parse_record "$@"
fi

broadcast1 finish
#cat1 /tmp/log1

