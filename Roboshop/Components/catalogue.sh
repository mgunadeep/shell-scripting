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

echo -n "Installing the nodejs.."
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
yum install nodejs -y &>> $logfile
status $?

echo -n "Creating a service account:"
useradd $user
status $?

echo -n "Switching to the service account-"$user":"
sudo su - $user
status $?

echo -n "Downloading the $component code:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?

echo -n "Unzipping..."
cd /home/$user
unzip /tmp/$component.zip &>> $logfile

echo -n "Renaming the file:"
mv $component-main $component
status $?

echo -n "Installing the necessary dependencies.."
cd /home/$user/$component
npm install &>> $logfile
status $?



