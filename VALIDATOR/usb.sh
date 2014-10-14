
#video: mounting /dev/sdb1 and use fstab
#http://linuxconfig.org/howto-mount-usb-drive-in-linux
set -u
source /tmp/library.cfg
use dialog_confirm
depend easytag




umount1(){
  #http://www.cyberciti.biz/tips/how-do-i-forcefully-unmount-a-disk-partition.html
  umount -f $device
  umount -l $device
  echo fuser -km $device
}

wget1(){
  while :; do  pidof wget || break; sleep 5 ; done; xcowsay 'wget finish'
  }

  ls1(){
    print func
  commander "sudo fdisk -l "
  #$| grep $device_name" 
    commander "ls /dev/sd*"
    commander    'mount | grep dev/sd'
  }

  ls2(){
    lsof | grep $device
  }

  mkdir1(){
    print func
    commander sudo mkdir -p $dir1
    commander sudo chown $LOGNAME $dir1
    #sudo mount /dev/sd${num}
  }

  format1(){
    print func
    #echo mkfs.fat32 \$device_name
    sudo mkfs.fat $device

  }

  mount1(){

    local cmd="sudo mount -o gid=users,fmask=113,dmask=002 $device $dir1" 
    commander $cmd
    #dialog_confirm mount? 


    #echo sudo mount -t $filetype -o -m=644,-M=755 $device_name /mnt/usb
    #echo sudo mount -a
  }

  choose_storage(){
    
    echo which device_name to mount ?
    read device_name
    #export device_name
    export device=/dev/$device_name
    print color 33 $device_name
    print color 35 $device

    export dir1=/mnt/usb_${device_name}

    print color 36 "dir1: $dir1"
  }

  fs1(){
    echo thunar $dir1
  }
  ensure_not_mounted(){
    print func
( sudo mount | grep $device ) && { print ok device already mounted; exiting;  }
  }

  steps(){
    print color 33 show list of available device_names


commander ls1
commander    choose_storage 
commander ensure_not_mounted
commander    mkdir1
echo press enter
read
commander    mount1
commander    ls2
echo press_enter
read
commander    fs1
    #format1
  }

  if [ $# -eq 0 ];then
    steps
  else
    type $1
  fi
