#!/bin/bash

component=catalogue
logfile=/tmp/$component.log
user=roboshop

ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a "root" to perform this action or should obtain, "sudo" privileages. \e[0m"
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

echo -n "Configuring the repo"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
status $?

echo -n "Installing the nodejs.."
yum install nodejs -y &>> $logfile
status $?

id $user &>> $logfile
if [ $? -ne 0 ]; then 
echo -n "Creating a service account:"
useradd $user &>> $logfile
status $?
fi

echo -n "Downloading the $component code:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?

echo -n "Unzipping..."
cd /home/$user
unzip -o /tmp/$component.zip &>> $logfile

echo -n "Renaming the file:"
mv $component-main $component
status $?

echo -n "Modifying the ownership"
chown -R $user:$user /home/Roboshop/$component
status $?