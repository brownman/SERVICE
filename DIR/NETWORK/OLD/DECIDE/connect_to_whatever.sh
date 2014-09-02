echo1(){
trace "$@"
}
#echo1 http://askubuntu.com/questions/149411/iwconfig-usage-for-wep-access-point


#echo1 You can't get IP from DHCP Server.. probably you have wrong parameters in your iwconfig command or its not complete! Im going to make a comprehensive troubleshoot for you however some of them would be unrelated to your case! First of all lets check if there's other services using your wireless card.. you can try unblocking radio frequencies with this command:

sudo ifconfig $device down
sudo rfkill unblock wifi

echo after that check block status :

sudo rfkill list

echo if there\'s any \"yes\" beyond Wireless LAN ..
#echo1 , it means something preventing rfkill to unblock your wifi; you should find that service and stop it. $ sudo service {service} stop generally,they are other network tools.especially network managers. stop them or uninstall.

#echo1   after that set iwconfig parameters in a proper way..to see wifi access points and their specifications:

sudo iwlist scan     
#echo1 ' You can add \| grep searchvalue to search for a particular name'

#echo1 check those parameters and fill \(use root privilege sudo or su root\) : note : the wifi interface name could be different in your machine \(eth# or wlan#\)


#echo1   iwconfig $device essid {name of access point}
#echo1     iwconfig $device ap {access point mac address}
#echo1   or if you don\'t know the MAC Address of access point :

echo commander "iwconfig $device ap any"
#echo1   and :

echo 'on/off/restricted'
sudo iwconfig $device enc on

echo 'password'
echo commander "iwconfig $device key s:$key"

#echo1  at last pull up connection :

sudo ifconfig $device up
#echo1   now request for an IP :

sudo dhclient $device
#echo1   check if your connection succeed (there should be an IP4) :

sudo ifconfig $device
#echo1    or ping your gateway (route) ..Good luck
