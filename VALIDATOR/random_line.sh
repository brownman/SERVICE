
use random

file1=$1
file2=$2
file3=$3

func1(){
local file=$1
local num=$2
local timeout=$3
local str=$( sed -n ${num}p $file );
xcowsay "$str" &
sleep $timeout 
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
func1 $file1 $num1 3
func1 $file2 $num1 5
func1 $file3 $num1 6
