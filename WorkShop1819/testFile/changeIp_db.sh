#!/bin/bash

	IP=$(hostname  -i)

#	$ indica la riga alla fine del file
#	a append

	sed -e "\$a[mysql]" my.cnf && \
	sed -e "\$auser=root" my.cnf && \
    	sed -e "\$apassword=Admin20" my.cnf && \
	sed -i "s/172.17.0.3/$IP/g" backup.sql

# crea un database e ripristina il backup
	#	mysql -e "create database wordpress"
	#	mysql wordpress < backup.sql
	#rm backup.sql

	USER=$(whoami)
        if [ $USER == 'root' ]; then
               su user
      	fi
