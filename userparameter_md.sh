#!/bin/bash
#set -x
#check the service if it's running or not

status=$(systemctl show dhcpd | grep substate -i|cut -d '=' -f 2)

if  [ "$status" = "running" ]; then
      echo "1"
else
      echo "0"
fi

#echo $status

