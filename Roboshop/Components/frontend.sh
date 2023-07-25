#!/bin/bash

webserver=nginx
component=frontend
logfile=/tmp/frontend.log

ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a root to perform this or should have sudo privileage \e[0m"
    exit 1
fi

status () {
    if [ $1 -eq 0 ]; then 
            echo -e "\e[32m Success \e[0m"
    else
            echo -e "\e[31m failure \e[0m"
    fi
}

echo -n "Installing $webserver:"
yum install $webserver -y &>> $logfile
status $?

echo -n "Enabling the $component"
systemctl enable nginx
status $?

echo -n "Starting the $component webserver"
systemctl start nginx
status $?

echo -n "Downloading the $component content:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?


echo -n "Doing a cleanup:"
cd /usr/share/$webserver/html
rm -rf *
status $?

echo -n "unzipping the content:"
unzip /tmp/$component.zip &>> $logfile
status $?

echo -n "moving the content"
mv $component-main/* .
mv static/* .
status $?

echo -n "removing the unneccesay files"
rm -rf $component-main README.md
status $?

echo -n "Deploying the nginx in default location"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
status $?

echo "Restarting the $component service"
systemctl restart $webserver
status $?


