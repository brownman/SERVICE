#cmd_err="'gxmessage -file /tmp/err' -title cron_err -sticky -ontop -timeout 10"
vol0='amixer set Master 100%'
vol1='amixer set Master 0%'

#flite -t "Ofer - Ofer - listen to this'
$vol1;
str=`fortune -s | tee -a /tmp/quotes.txt | fmt -w 50`; 
xcowsay "$str" --time 60 --at=0,0 --cow-size=small;
$vol0;

