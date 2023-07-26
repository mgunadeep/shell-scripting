#!/bin/bash

component=redis

source components/common.sh

echo -n "Configuring the repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/$component/main/$component.repo -o /etc/yum.repos.d/$component.repo  &>> $logfile
status $?

echo -n "Installing $component:"
yum install $component-6.2.11 -y  &>> $logfile
status $?

echo -n "Updating the bindIP address:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/$component.conf /etc/$component/$component.conf &>> $logfile
status $?

echo -n "Starting the $component:"
systemctl enable $component &>> $logfile
systemctl start $component
status $?

echo -n "Checking the Redis status:"
systemctl status $component -l
status $?
