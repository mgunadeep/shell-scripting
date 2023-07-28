#!/bin/bash

appuser=roboshop
component=cart
logfile=/tmp/cart.log

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
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> $logfile
status $?

echo -n "Installing the nodejs:"
yum install nodejs -y &>> $logfile
status $?

id $appuser &>> $logfile
if [ $? -ne 0 ]; then 
    echo -n "Creating a service account:"
    useradd $appuser &>> $logfile
    status $?
fi

echo -n "Downloading the $component file:"
curl -s -L -o /tmp/cart.zip "https://github.com/stans-robot-project/cart/archive/main.zip"  &>> $logfile
status $?

echo -n "Unzipping..:"
cd /home/roboshop
unzip -o /tmp/cart.zip  &>> $logfile
status $?

echo -n "Renaming the file:"
mv cart-main cart
status $?

echo -n "Installing the necessary dependencies:"
cd cart
npm install  &>> $logfile
status $?

echo -n "Updating the systemD file:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal  /home/roboshop/cart/systemd.service
status $?

echo -n "Setting up with systemctl:"
mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
status  $?

echo -n "Reloading the $component:"
systemctl daemon-reload
status $?

echo -n "Starting the $component:"
systemctl enable cart  &>> $logfile
systemctl restart cart
status $?

echo -n "Checking the status of $component:"
systemctl status cart -l
status $?