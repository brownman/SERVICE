
set -o nounset

run(){

local cmd1="$dir_root/VOICE/listen.sh" 
local cmd2="xterm -bg black -fg white -e $cmd1"
echo "[CMD] $cmd2"
eval "$cmd2" 
}
run &
