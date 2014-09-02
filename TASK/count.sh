set_env(){
  file_points=/tmp/count
}

run(){
  if [ -f $file_points ];then
    num=`cat $file_points` 
    let num+=1 || { let num=0; }
  else
    let   num=0
  fi

  echo $num > $file_points

  xcowsay "$num          Rounds !" &

}
#reset1 &
steps(){

  set_env
  run
}

steps 



