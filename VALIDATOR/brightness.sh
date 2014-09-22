num=${1:-40}
gksudo echo hi
#subshell sudo $dir_SERVICE/SH/brightness_lenovo.py $num

 sudo $dir_SERVICE/SH/brightness_lenovo.py $num 
res=$?
 test $res -eq 0 && ( xcowsay "done: $(  sudo  $dir_SERVICE/SH/brightness_lenovo.py )" )

