#!/bin/bash

component=user
source components/common.sh

echo -n "Configuring the repo:"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
status $?

echo -n "Installing the nodejs:"
yum install nodejs -y
status $?

id $user &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created, then it creates a new one.
echo -n "Creating a service account:"
useradd $user &>> $logfile
status $?
fi

