#!/bin/bash
#configuration of pavucontrol - without using microphone, speakers : audio is working virtually and sound can be recorded using : flite.

#WORKING: speakiers are muted but sound is functioning and recording is working 
#pav..:tabs: 
#configuration: analog stereo input 
#input devices: show all input devices
#input devices: focus on: monitor of dummy output
#               3 buttons: off|on|on
#recording:     monitor of dummy output
#2 butotns: off|on
#output devices: 
#3 buttons: off|on|on
#set -x
exec 2>/tmp/err
#> >(  tee /tmp/err )


trap_err(){
echo caller:
echo `caller`
echo
cat /tmp/err
rm /tmp/err
exit 0
}
clear
#trap trap_err ERR





pushd `dirname $0` >/dev/null

dir_self=`pwd`
#where_am_i $0`
file1=$dir_self/TMP/out/sentences.corpus
echo $file1
echo ---
cat $file1



   toilet --gay listen
   #ls -1
  
   #sleep 2
   echo
   cmd='python2 ./listen.py'
   echo $cmd
   eval "$cmd"
popd >/dev/null
echo the end
