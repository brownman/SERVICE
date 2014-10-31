set -u
use dialog_sleep
use point
use_sh awake
use flite1

trap - ERR
trap_exit(){
  $vol0
}

set_env(){
  echo
}

intro(){
  xcowsay 'lir ?' &
  sleep 1
  xcowsay 'Oct 17 => 99 days' &
  sleep 1
}


sleeping(){
  xcowsay 'enjoy 1 min till suspension - game'
  dialog_sleep 60 'relax before suspension'
  xcowsay 'I choose to do for others first'
  #dialog_sleep 120 'suspension game'
}
black(){
  commander $builtin_awake
}


update_missions(){
  gvim $dir_workspace/missions.yaml
  open_with "$url_todo"

}
decide(){
  set +e
#  dialog_optional "Am I really deserve it? points +1 ?" 
dialog_optional 'Am I a man of honour ?'
  local res=$?
  if [ $res -eq 0 ];then
    xcowsay "great choice - but I may cancel it "
    sleep 1
    random 5
    test $? -eq 0 && black
    hotkey_overide 'suspension game' '/tmp/service.sh game &'
    sleeping 
  else
    point_reset
    point_show
    black
  fi 
}

steps(){

  ### SOUND -
  xcowsay 'I do it for Lir'
  set_env
  commander "$vol1"
  intro
################### game or die
  decide 
############ UPGRADE
  update_missions
  wmctrl -a gvim || (   dialog_optional_edit "$(who_am_i $0)" )
  ### SOUND +
  commander "$vol0"

}
testing(){
echo 
}
#trap trap_exit EXIT
#testing #&& steps
#steps
#loop1
#black
steps
#/tmp/service.sh 1_word
