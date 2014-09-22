num=${1:-40}
gksudo echo hi
subshell sudo $dir_SERVICE/SH/brightness_lenovo.py $num
xcowsay $?
