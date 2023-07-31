#!/bin/bash
component=mysql
logfile=/tmp/$component.log

source Roboshop/components/repeat.sh

echo -n "Configuring the repo:"
curl -s -L -o /etc/yum.repos.d/$component.repo https://raw.githubusercontent.com/stans-robot-project/$component/main/$component.repo &>> $logfile
status $?

echo -n "Installing the $component:"
yum install $component-community-server -y &>> $logfile
status $?

echo -n "Starting the $component:"
systemctl enable mysqld &>> $logfile
systemctl start mysqld
status $?

