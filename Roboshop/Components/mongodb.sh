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

echo -n "Setting up the $component repo's:"
curl -s -o /etc/yum.repos.d/$component.repo https://raw.githubusercontent.com/stans-robot-project/$component/main/mongo.repo &>> $logfile
status $?

echo -n "Installing the $component:"
yum install -y $component-org &>> $logfile
status $?

echo -n "Enabling the $component:"
systemctl enable mongod &>> $logfile
status $?

echo -n "Starting the $component service:"
systemctl start mongod
status $?

echo -n "Updating the IP and giving access to $component"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
status $?

