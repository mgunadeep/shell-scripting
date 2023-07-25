#!/bin/bash

webserver=nginx
component=frontend


ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a root to perform this or should have sudo privileage \e[0m"
    exit 1
fi


echo "Installing $webserver"
yum install nginx -y &>> /tmp/frontend.log

if[ $? -eq 0 ]; then 
        echo -e "\e[32m Success \e0[m"
else
        echo -e "\e[31m failure \e0[m"
fi
# echo -n "Downloading the $component html content"
# curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
# echo $? 

# echo -n "Deplyoing in the nginx default loccation"
# cd /usr/share/nginx/html
# rm -rf *

# echo -n "unzipping the content"
# unzip /tmp/$component.zip

# mv $component-main/* .
# mv static/* .
# rm -rf $component-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf






