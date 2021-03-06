#alias set=set1
set -u
#use network
#use network_vars.conf
set +x


using2(){
  use dialog_optional
  use indicator
  use commander
  #use stepper
  use print
  use act_on_list
  use assert
}

set_env(){
  script="$dir_SERVICE/DIR/WALLPAPER/wallpaper_single.sh"
  file_list="$dir_SERVICE/LIST/wallpaper.txt"
}
intro(){
  local str="$1"
  xcowsay "wallpaper update $str" 
}

func1(){
  #trap - ERR
  print func

set +e
(   random 20 ) && ( dialog_optionl_edit  $file_list )
  #killall conky
  local cmd="act_on_list $file_list $script"
  ( commander $cmd  ) 
  #|| { print error ; exit 1; }
}
steps(){
  using2
  set_env
#  intro start
  func1
  intro finish

}

#dialog_optional minimize "$cmd" &
#cmd_minimize='wmctrl -k on' #it won't work because conkey elements are actually windows :(
#commander $cmd_minimize
steps
