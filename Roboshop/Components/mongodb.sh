#!/bin/bash
component=mongodb
logfile=/tmp/$component.log

ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a "root" to perform this action or should obtain, "sudo" privileages \e[0m"
    exit 1
fi

status () {
    if [ $1 -eq 0 ]; then 
            echo -e "\e[32m Success \e[0m"
    else
            echo -e "\e[31m failure \e[0m"
            exit 2
    fi
}

echo -n "Setting up the $component repo's:"
curl -s -o /etc/yum.repos.d/$component.repo https://raw.githubusercontent.com/stans-robot-project/$component/main/mongo.repo &>> $logfile
status $?

echo -n "Installing the $component..:"
yum install -y $component-org &>> $logfile
status $?

echo -n "Updating the IP and giving DB access to other internal components:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
status $?

echo -n "Restarting the $component service...:"
systemctl daemon-reload 
status $?

echo -n "Enabling the $component:"
systemctl enable mongod &>> $logfile
status $?

echo -n "Starting the $component service..:"
systemctl start mongod
status $?


echo -n "Downloading the $component schema:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?

echo -n "Unzipping...:"
cd /tmp
unzip -o $component.zip  &>> $logfile
status $?

echo -n "Injecting the schema..:"
cd $component-main
mongo < catalogue.js &>> $logfile
mongo < users.js     &>> $logfile
status $?

