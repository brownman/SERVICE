
use random

file1=$1
file2=$2

func1(){
local file=$1
local num=$2
local str=$( sed -n ${num}p $file );
xcowsay "$str" &
sleep 3
}

pick_1(){
local file=$1
local num=$( cat $file | wc -l );
set +e;
( random $num );
local res=$?;
return $res
}



#decide line number
pick_1 $file1
num1=$?
echo $num1

#print line x from both files
func1 $file1 $num1
func1 $file2 $num1
