clear
loop1(){
file_suspend=$HOME/suspend.txt
cat1 $file_suspend true
while read line;do
    echo commander "$line"
done < $file_suspend
}
loop1
