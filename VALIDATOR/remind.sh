#https://wiki.archlinux.org/index.php/Daemons_List
commander "assert left_bigger $# 1"
min=$1
shift 
cmd=$@
echo "echo $cmd | at now + $min minutes" 1> >(xcowsay ) 
sleep 1

commander "echo $cmd | at now + $min minutes" #2> >(xcowsay ) 
#( egrep -h cmd\|job | xcowsay )
