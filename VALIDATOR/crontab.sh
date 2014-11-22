#let num_random=12
#use random
#random $num_random && ( dialog_yes_no 'upgrade productivity ?' && ( crontab_update  ))
#trap - ERR
#set -e
set -u
crontab_update(){
use dialog_optional



  local file=$dir_workspace/crontab.txt
commander assert file_exist $file
#  dialog_optional  'update services ?' && ( 
  #commander gvim -f $dir_SERVICE; 
  #set +e
  dialog_optional  'edit crontab ?' && ( 
  gvim -f $file

  commander   time_update

  assert var_exist time_secs
  commander  "crontab -l > /tmp/crontab.bak.$time_secs"
  commander crontab $file 
  #commander  crontab -l

  cat $file | grep -v '\#'
  )
 # || ( trace skip )
}


#gvim -f $file_crontab;crontab $file_crontab;xcowsay 'crontab restarted'
crontab_update
