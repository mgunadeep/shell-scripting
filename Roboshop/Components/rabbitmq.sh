#!/bin/bash 

appuser=roboshop
component=rabbitmq
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

echo -n "Downloading the Erlang dependency:"
curl -s https://packagecloud.io/install/repositories/$component/erlang/script.rpm.sh | sudo bash &>> $logfile
status $?

echo -n "Configuring the repo:"
curl -s https://packagecloud.io/install/repositories/$component/rabbitmq-server/script.rpm.sh | sudo bash  &>> $logfile
status $?

echo -n "Installing the $component:"
yum install rabbitmq-server -y &>> $logfile
status $?

echo -n "Enabling and restarting the $component:"
systemctl enable $component-server  &>> $logfile
systemctl restart $component-server
status $?

echo -n "Checking the status of $component:"
systemctl status $component-server -l  &>> $logfile
status $?

echo -n "Creating a useraccount $appuser for, $component:"
rabbitmqctl add_user $appuser $appuser123
status $?

echo -n "Giving the necessary privileages for $appuser useraccount:"
rabbitmqctl set_user_tags $appuser administrator  &>> $logfile
rabbitmqctl set_permissions -p / $appuser ".*" ".*" ".*"  &>> $logfile
status $?

