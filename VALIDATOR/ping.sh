dir=$HOME/ping
file=$HOME/ping/$(date +"%H_%M_%e_%m_%y")
test -d $dir || ( mkdir -p $dir ) 
ping -c 3 google.com | grep loss |  cut -d',' -f3- | xargs > $file
cat $file



