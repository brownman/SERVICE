set -u
#set -e
use dialog_sleep
use point
use_sh awake
########################## points and wallpaper
dialog_optional 'make a breathrough ?' || { point_reset; exiting; }
point_up
point_show
/tmp/service.sh game &
dialog_sleep 60
########################## suspend
commander $builtin_awake
########################## easy for a robot
#flite -t 'you are free'
#flite -t 'update the missions'
#flite -t easy for a robot
#fi
/tmp/service.sh 1_word

gvim $dir_workspace/missions.yaml

