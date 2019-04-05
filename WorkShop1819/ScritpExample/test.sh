 #!/bin/bash
 if [ $# -eq 1 ]; then
	 INTERFACE=$1
	 IP=$(sudo ifconfig $INTERFACE | grep "inet" | awk '{print $2'})
	 echo "L'ip di $INTERFACE è $IP"
fi
x=(3 2)
echo ${x[0]}

