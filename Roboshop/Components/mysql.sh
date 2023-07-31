#!/bin/bash
component=mysql
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
curl -s -L -o /etc/yum.repos.d/$component.repo https://raw.githubusercontent.com/stans-robot-project/$component/main/$component.repo &>> $logfile
status $1

echo -n "Installing the $component:"
yum install $component-community-server -y &>> $logfile
status $1

echo -n "Starting the $component:"
systemctl enable mysqld &>> $logfile
systemctl start mysqld
status $1

