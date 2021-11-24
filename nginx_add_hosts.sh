#!/bin/bash

echo -e "\n"
echo -e "\033[1;36m      ########################################################\e[00m"
echo -e "\033[1;36m      ####        Add an NGINX virtual host script        ####\e[00m"
echo -e "\033[1;36m      ########################################################\e[00m"
echo -e "\n"

create_vhost(){
	read -p "Enter the domain ( ex: example.com ): " HOST
	echo -e ""
	echo -e "Virtual Host is started to creating ${HOST} \e[00m"
        #Fake progress for better effect - thanx to Buchtič!
        count=0
        until [ $count -eq 4 ]
        do
        echo -ne "\033[1;36m"
        echo -n "##############"
        sleep 1
        count=`expr $count + 1`
        done
        echo -ne "\e[00m"
        echo -ne "\033[1;32m"
        echo -n "  100%"
        echo -ne "\e[00m"
	cp vhost_template.txt /etc/nginx/sites-available/${HOST}
	sed -i "s|host|${HOST}|g" /etc/nginx/sites-available/${HOST}
        ln -s /etc/nginx/sites-available/${HOST} /etc/nginx/sites-enabled/${HOST}
        mkdir /var/www/${HOST}/
        mkdir /var/www/${HOST}/html/
        cp test_index.html /var/www/${HOST}/html/index.html
        chmod 755 -R /var/www/${HOST}/*
        echo -e "\n"
        echo -e "\e[01;32m      ########################################################\e[00m"
        echo -e "\e[01;32m      ####    Virtual host has been sucesfully created    ####\e[00m"
        echo -e "\e[01;32m      ########################################################\e[00m"
        echo -e "\n"
        /etc/init.d/nginx restart
}

create_vhost
