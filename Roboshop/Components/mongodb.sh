#!/bin/bash
component=mongodb
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

echo -n "Setting up the $component repo's"
yum install -y $component-org &>> $logfile
status $?

echo -n "Enabling the $component"
systemctl enable mongod &>> $logfile
status $?

echo -n "Starting the $component service"
systemctl start mongod
status $?
