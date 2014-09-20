#http://www.cyberciti.biz/faq/linux-getting-scsi-ide-harddisk-information/
set -u
drive=$1
echo sudo mkfs.vfat /dev/$drive

