#!/bin/bash

component=redis
source components/common.sh

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
systemctl status redis -l &>>logfile
status $?

