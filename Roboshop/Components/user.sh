#!/bin/bash

component=user
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
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
status $?

echo -n "Installing the nodejs:"
yum install nodejs -y &>> $logfile
status $?

id $user &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created, then it creates a new one.
echo -n "Creating a service account:"
useradd $user &>> $logfile
fi
status $?

