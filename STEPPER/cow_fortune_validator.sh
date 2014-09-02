SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin:/usr/games
TERM=xterm
DISPLAY=:0 
LOGNAME=paretech
cmd_err="'gxmessage -file /tmp/err' -title cron_err -sticky -ontop -timeout 10"
vol0='amixer set Master 100%'
vol1='amixer set Master 0%'


$vol1;
str=`fortune -s | tee -a /tmp/quotes.txt | fmt -w 50`; 
xcowsay "$str" --time 60 --at=0,0 --cow-size=small;
$vol0;

