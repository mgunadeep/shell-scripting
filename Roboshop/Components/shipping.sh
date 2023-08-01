#!/bin/bash

appuser=roboshop
component=shipping
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


echo -n "Installing the maven:"
yum install maven -y &>> $logfile
status $?

id $appuser &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created, then it creates a new one.
   echo -n "Creating a $appuser service account:"
   useradd $appuser &>> $logfile
   status $?
fi

echo -n "Downloading the repo:"
cd /home/$appuser
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip"  &>> $logfile
status $?

echo -n "Unzipping and Renaming:"
rm -rf $component &>> $logfile
unzip -o /tmp/$component.zip &>> $logfile
mv -f $component-main $component
status $?

echo -n "Changing the permissions:"
chown -R $appuser:$appuser $component
status $?

echo -n "Performing a cleanup:"
cd $component
mvn clean package &>> $logfile
mv -f target/$component-1.0.jar  $component.jar
status $?

echo -n "Updating the systemD file:"
sed -i -e 's/CARTENDPOINT/cart.roboshop.internal/' -e 's/DBHOST/mysql.roboshop.internal/'  /home/roboshop/$component/systemd.service 
status $?

echo -n "SettingUp the systemD service:"
mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service
status $?

echo -n "Reloading the service:"
systemctl daemon-reload
status $?

echo -n "Enabling and restarting $component:"
systemctl enable shipping  &>> $logfile
systemctl restart shipping
status $?

echo -n "Checking the status of $component:"
systemctl status shipping -l 
status $?



