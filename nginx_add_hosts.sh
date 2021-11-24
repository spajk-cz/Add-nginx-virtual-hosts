#!/bin/bash
echo -e "\n"
echo -e "\e[01;32m      ##################################\e[00m"
echo -e "\e[01;32m      ####    Add an NGINX vHost    ####\e[00m"
echo -e "\e[01;32m      ##################################\e[00m"
echo -e "\n"

create_vhost(){
	read -p "Enter the domain ( ex: example.com ): " HOST
	echo -e ""
	echo -e "Virtual Host is started to creating ${HOST} \e[00m"
	cp vhost_template.txt /etc/nginx/sites-available/${HOST}
	sed -i "s|host|${HOST}|g" /etc/nginx/sites-available/${HOST}
#        find /etc/nginx/sites-available/${HOST} -type f -exec sed -i 's/%host/'${HOST}'/g' {} \;
        ln -s /etc/nginx/sites-available/${HOST} /etc/nginx/sites-enabled/${HOST}
        mkdir /var/www/${HOST}/
        mkdir /var/www/${HOST}/html/
        cp test_index.html /var/www/${HOST}/html/index.html
        chmod 755 -R /var/www/${HOST}/*
        /etc/init.d/nginx restart
        echo -e "Virtual Host Created"
}

create_vhost
