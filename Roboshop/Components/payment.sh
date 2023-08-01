#!/bin/bash

appuser=roboshop
component=payment
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


echo -n "Installing the python3:"
yum install python36 gcc python3-devel -y  &>> $logfile
status $?

id $appuser &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created, then it creates a new one.
   echo -n "Creating a useraccount for $component:"
   useradd $appuser &>> $logfile
   status $?
fi

echo -n "Configuring the repo for $component:"
cd /home/roboshop
curl -L -s -o /tmp/payment.zip "https://github.com/stans-robot-project/$component/archive/main.zip"   &>> $logfile
status $?

echo -n "Unzipping..:"
rm -rf $component  &>> $logfile
unzip -o /tmp/payment.zip  &>> $logfile
mv -f $component-main $component
status $?

echo -n "Changing the ownership:"
chown -R $appuser:$appuser $component
status $?

echo -n "Installing the necessary dependencies:"
cd /home/roboshop/$component 
pip3 install -r requirements.txt  &>> $logfile
status $?


userid=$(id -u roboshop)
groupid=$(id -g roboshop)

echo -n "Updating the uid and gid of $appuser in $component.ini file:"
sed -i  -e "/^uid/ c uid=$userid" -e "/^gid/ c gid=$groupid" /home/roboshop/$component/payment.ini
status $?

echo -n "Updating the DNS in systemD file of $component:"
sed -i -e 's/AMQPHOST/mysql.roboshop.internal/' -e 's/USERHOST/user.roboshop.internal/' -e 's/CARTHOST/cart.roboshop.internal/' /home/roboshop/$component/systemd.service
status $?

echo -n "SettingUp the $component with systemctl:"
mv -f /home/roboshop/$component/systemd.service /etc/systemd/system/$component.service
status $?

echo -n "Reloading and Enabling the $component:"
systemctl daemon-reload
systemctl enable $component  &>> $logfile
status $?

echo -n "Restarting the $component service:"
systemctl restart $component
status $?

echo -n "Checking the status of $component:"
systemctl status $component -l &>> $logfile
status $?
