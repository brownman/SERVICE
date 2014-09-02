#!/bin/bash
#source /tmp/service.sh
exec 2> >( tee /tmp/err1 )
clear
trap - ERR
trap_err1(){
echo $FUNCNAME
#echo "`caller`"
cat /tmp/err1
exit 1
}
trap trap_err1 ERR

use print
use list_strip
use touch1
use rm1
use mkdir1
use assert

use_many where_am_i cat1

set -o nounset
dir_self=`where_am_i $0` 
blatherdir=$dir_self/TMP
sentences=$blatherdir/out/sentences.corpus
sourcefile=$blatherdir/static/commands
langdir=$blatherdir/config
tempfile=$blatherdir/url.txt
lmtoolurl=http://www.speech.cs.cmu.edu/cgi-bin/tools/lmtool/run

cd $blatherdir
file_out=/tmp/list1
commander list_strip $sourcefile $file_out
#commander cat1  $file_out true

#read1 true || exiting

#print_g xcowsay updating start
xcowsay start & 
sed -f - $file_out > $sentences <<EOF
  /^$/d
  /^#/d
  s/\:.*$//
EOF

# upload corpus file, find the resulting dictionary file url
curl -L -F corpus=@"$sentences" -F formtype=simple $lmtoolurl \
  |grep -A 1 "base name" |grep http \
  | sed -e 's/^.*\="//' | sed -e 's/\.tgz.*$//' | sed -e 's/TAR//' > $tempfile

# download the .dic and .lm files
curl -C - -O $(cat $tempfile).dic
curl -C - -O $(cat $tempfile).lm

# mv em to the right name/place
mv $langdir/* /tmp
commander mv *.dic $langdir/1.dic
commander mv *.lm $langdir/1.lm

rm $tempfile

print_g xcowsay updating finish
