sudo iwlist wlp5s0 scanning  > /tmp/sniff

print_color 33 'no encryptions:'
cat /tmp/sniff | grep 'Encryption key:off' -B 10 -A 10 > /tmp/out
cat1 /tmp/out
#| egrep  ESSID --color=auto

