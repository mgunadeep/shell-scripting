#!/bin/bash

component=redis
logfile=/tmp/$component.log

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

echo -n "Configuring the repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/$component/main/$component.repo -o /etc/yum.repos.d/$component.repo &>>logfile
status $?

echo -n "Installing the $component:"
yum install $component - 6.2.11 -y &>>logfile
status $?

echo -n "Updating the bindIP:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/$component.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/$component/$component.conf
status $?

echo -n "Reloading the service"
systemctl daemon-reload
status $?

echo -n "Enabling and starting the $component:"
systemctl enable $component &>>logfile
systemctl restart $component
status $?

echo -n "Checking the status:"
systemctl status redis -l
status $?

