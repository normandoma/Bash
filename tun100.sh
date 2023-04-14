#!/bin/vbash                                                                                                                                                                     
if [ $(id -gn) != vyattacfg ]; then                                                                                                                                              
    exec sg vyattacfg "$0 $*"                                                                                                                                                    
fi                                                                                                                                                                               
source /opt/vyatta/etc/functions/script-template                                                                                                                                 
HOST=172.16.1.2

ping -c1 $HOST 1>/dev/null 2>/dev/null
SUCCESS=$?

if [ $SUCCESS -eq 0 ]
then
  configure                                                                                                                                                                        
  set interfaces tunnel tun100 description "Management Tunnel"                                                                                                                     
  set interfaces tunnel tun100 address 172.16.2.254/24                                                                                                                             
  set interfaces tunnel tun100 multicast-enable                                                                                                                                    
  set interfaces tunnel tun100 encapsulation gre                                                                                                                                   
  set interfaces tunnel tun100 parameters ip key 100                                                                                                                               
  set interfaces tunnel tun100 source-interface vtun100                                                                                                                            
  set interfaces tunnel tun100 vrf XTREME-MGMT                                                                                                                                     
  commit                                                                                                                                                                           
  exit   
else
  echo "$HOST didn't reply"
fi





                                                                                                                                                                          
                                                                                                                                                                                 
~                                                                                                                                                                                
~                                                                                                                                                                                
~                                                                                                                                                                                
~                                                                                                                                                                                
~                         