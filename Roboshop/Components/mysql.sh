#!/bin/bash
component=mysql
source components/common.sh

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

