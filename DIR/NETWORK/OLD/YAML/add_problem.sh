dir_self=`where_am_i $0`
dir=$dir_self/FIX
file=`echo $@ | sed 's/ /_/g'`
confirm "touch $dir/$file"
