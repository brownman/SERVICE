ensure_service(){
#service:
#cronie
#atd
local service="$1"
systemctl status $service && ( notify-send $service 'is working' ) || ( 
dialog_optional "restart $service ?" &&  ( commander gksu systemctl start $service ))
xcowsay $?

}


min=${1:-30}

service=cronie
commander "ensure_service $service"
service=atd
commander "ensure_service $service"



print color 33 'recursive call:' 
commander /tmp/service.sh remind $min '/tmp/service.sh ensure_service'


