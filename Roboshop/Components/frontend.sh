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


# mv $component-main/* .
# mv static/* .
# rm -rf $component-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf






