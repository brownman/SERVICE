
export dir_NETWORK=`where_am_i $0`
pushd "$dir_NETWORK" >/dev/null


run(){
set +e
#commander source network.cfg
#commander source network_vars.1st

ls -1 STEPS/
local cmd="stepper $file_list $verbose eval"
( commander "$cmd" )
}

file_list=${1:-STEPS/wpa.txt}
verbose=${2:-false}
run
echo
popd >/dev/null

