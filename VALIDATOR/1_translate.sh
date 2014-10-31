use file_update

file=/tmp/translations.txt

run(){
input=${1:-}
str=$( gxmessage -entrytext "$input" -title translate -file $file $GXMESSAGE )
file_update $file $str
`use_sh translate` $str
}

history_pick(){
local input0=''
if [  -s $file ];then
input0=$(   tail -1 $file )
fi
echo $input0
}


input1=$( history_pick )
run "$input1"
