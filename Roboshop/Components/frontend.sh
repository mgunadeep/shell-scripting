#!/bin/bash

webserver=nginx
component=frontend
logfile=/tmp/frontend.log

ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a root to perform this or should have sudo privileage \e[0m"
    exit 1
fi


echo -n "Installing $webserver:"
yum install nginx -y &>> $logfile
if [ $? -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
else
        echo -e "\e[31m failure \e[0m"
fi

echo -n "Downloading the $component content:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
if [ $? -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
else
        echo -e "\e[31m failure \e[0m"
fi


# echo -n "Deplyoing in the nginx default loccation"
# cd /usr/share/nginx/html
# rm -rf *

# echo -n "unzipping the content"
# unzip /tmp/$component.zip

# mv $component-main/* .
# mv static/* .
# rm -rf $component-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf






