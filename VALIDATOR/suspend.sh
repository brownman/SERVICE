set -u
#set -e
echo hi
#source /tmp/library.cfg
#use vars
use dialog_sleep

missions(){
  url1='https://mail.google.com/tasks/ig?pli=1'
  url2='https://www.google.com/calendar/render?pli=1'
  url3='http://www.organico.co.il/parsley'
  commander "$BROWSER '$url2'" &
  sleep 2
  commander "$BROWSER '$url1'" &
  commander "$BROWSER '$url3'" &
  sleep 1
}

suspending(){
  use_sh awake
  $builtin_awake
  flite -t 'you are free'
  flite -t 'update the missions'
}

dialog_optional 'update missions ?' 
res=$?
if [ $res -eq 0 ];then
  random 4 && suspending || ( missions
  dialog_sleep 30 missions
  suspending
  )
else
  suspending
fi

