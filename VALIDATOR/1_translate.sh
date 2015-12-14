use file_update

file=/tmp/translations.txt
lang=ru
run(){
input=${1:-}
str=$( gxmessage -entrytext "$input" -title translate -file $file $GXMESSAGE )

script=$( use_sh translate )
commander $script $lang $str

file_update $file $str
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
