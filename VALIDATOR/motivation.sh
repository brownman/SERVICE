#cmd_err="'gxmessage -file /tmp/err' -title cron_err -sticky -ontop -timeout 10"
vol0='amixer set Master 100%'
vol1='amixer set Master 0%'

#flite -t "Ofer - Ofer - listen to this'
test $mute = false || $vol1;
str=`fortune -s | tee -a /tmp/quotes.txt | fmt -w 50`; 
xcowsay "$str" --time 60 --at=0,0 --cow-size=small --bubble-at=0,111;

test $mute = false || $vol0;

