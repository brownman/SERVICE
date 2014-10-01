ensure_service(){
#service:
#cronie
#atd
local service="$1"
systemctl status $service && ( notify-send $service 'is working' ) || ( 
dialog_optional "restart $service ?" &&  ( commander gksu systemctl start
$service ))

}



service=atd
commander "ensure_service $service"

service=cronie
commander "ensure_service $service"


print color 33 'recursive call:' 
commander /tmp/service.sh remind 30 '/tmp/service.sh ensure_service'


