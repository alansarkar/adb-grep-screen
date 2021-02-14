#/bin/bash
Player=ffplay
x=$1
if [ $x -eq 1 ]
then
ifup lo

## flush manual
iptables -P INPUT ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables-nft -P INPUT ACCEPT
iptables-nft -P OUTPUT ACCEPT
iptables-nft -P FORWARD ACCEPT
iptables-legacy -P INPUT ACCEPT
iptables-legacy -P OUTPUT ACCEPT
iptables-legacy -P FORWARD ACCEPT
iptables -F INPUT 
iptables -F OUTPUT
iptables -F FORWARD 
iptables-nft -F INPUT 
iptables-nft -F OUTPUT 
iptables-nft -F FORWARD 
iptables-legacy -F INPUT 
iptables-legacy -F OUTPUT 
iptables-legacy -F FORWARD 
iptables -F 
iptables-nft -F 
iptables-legacy -F 
iptables -Z; # zero counters
iptables -F; # flush (delete) rules
iptables -X; # delete all extra chains

iptables-nft -Z; # zero counters
iptables-nft -F; # flush (delete) rules
iptables-nft -X; # delete all extra chains

iptables-legacy -Z; # zero counters
iptables-legacy -F; # flush (delete) rules
iptables-legacy -X; # delete all extra chains

   iptables -P OUTPUT ACCEPT
   iptables -P FORWARD ACCEPT
   iptables -F INPUT
   iptables -F OUTPUT
   iptables -F FORWARD
   iptables -F
   ip6tables -P INPUT ACCEPT
   ip6tables -P OUTPUT ACCEPT
   ip6tables -P FORWARD ACCEPT
   ip6tables -F INPUT
   ip6tables -F OUTPUT
   ip6tables -F FORWARD
   ip6tables -F
sysctl net.ipv4.ip_forward=1
sysctl  ipv6.disable_ipv6=1
   ufw disable 
sysctl --system
   echo firewall set for adb
fi 


if [ $x -eq 2 ] 
then 
echo "start adb screen share "
adb shell screenrecord   --output-format=h264  - |  $Player -framerate 60 -probesize 32 -sync video ---framerate 60 -probesize 16 -sync video

fi 
if [ $x == "-h" ] || [ $x ==  "--help" ]
then 
echo " help: 
       this script sets up adb connection and can also screen share or record too.
        adb.sh 1   to enable firewall for adb  needs root
        adb.sh 2 to startup screen share doesn't need root
        
        "
 fi
