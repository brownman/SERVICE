set -u
lesson=${1:-}
exec 2>/tmp/errr
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
true
    #file1=../DIR/scrapping/start.sh
}

func1(){
  local file1="$dir_SERVICE/DIR/scrapping/start.sh"
  ls -l $file1
 
  local cmd="$file1 $lesson"
  
   commander $cmd  
}
steps(){
 # commander  using2
 commander  set_env
  commander func1
}
echo hi
type steps
commander steps
echo bye
