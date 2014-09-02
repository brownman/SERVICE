test1(){
  while :;do
    use dialog_optional
    dialog_optional 'do something' true
    res=$?
    notify-send $res
  done
}

./listen.sh &
test1  


killall python2











