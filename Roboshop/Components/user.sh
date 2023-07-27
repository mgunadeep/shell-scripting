#!/bin/bash

appuser=roboshop
component=user
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

echo -n "Configuring the repo:"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
status $?

echo -n "Installing the nodejs:"
yum install nodejs -y &>> $logfile
status $?

id $appuser &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created, then it creates a new one.
echo -n "Creating a service account:"
useradd $appuser &>> $logfile
status $?
fi

echo -n "Downloading the $component code:"
curl -s -L -o /tmp/user.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?


echo -n "Unzipping..:"
cd /home/$appuser
rm -rf $component  &>> $logfile
unzip -o /tmp/user.zip &>> $logfile
status $?

echo -n "Renaming the file:"
mv user-main user
status $?

echo -n "Changing the ownership:"
chown -R roboshop:roboshop user
status $?

echo -n "Installing the necessary dependencies and generating the artifact:"
cd /home/$appuser/user
npm install &>> $logfile
status $?

echo -n "Updating the Redis and MongoDB DNS:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e /home/roboshop/user/systemd.service  
sed -i -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/' -e /home/roboshop/user/systemd.service 
status $?

echo -n "Settingup the service with systemctl:"
mv /home/roboshop/user/systemd.service  /etc/systemd/system/user.service
status $?

echo -n "Reloading the $component:"
systemctl daemon-reload
status $?

echo -n "Starting the $component:"
systemctl enable $component &>> $logfile
systemctl restart $component
status $?

echo -n "Checking the $component status"
systemctl status $component -l  &>> $logfile
status $?

