echo ping0 not working. . ok

commander sudo ifconfig eth0 down
commander sudo ifconfig eth0 up

commander sudo dhcpcd -v eth0

commander disown1 'gksudo dhcpcd-gtk'


#commander sudo dhclient -v eth0
( assert network_alive )
sleep 4
( assert network_alive )
update_clipboard assert network_alive
