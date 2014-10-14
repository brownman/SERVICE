#set -e
status_service(){
  systemctl status $service && ( notify-send $service 'is working' )
}
$cmd_trap_err
restart_service(){
dialog_optional "restart $service ?" || exiting
commander gksu systemctl start $service 
xcowsay $?
}

ensure_service(){
status_service || restart_service
}




min=${1:-30}
service=cronie
commander "ensure_service $service" && ( /tmp/service.sh crontab )

service=atd
commander "ensure_service $service"



print color 33 'recursive call:' 
commander "/tmp/service.sh remind $min '/tmp/service.sh ensure_service'"


