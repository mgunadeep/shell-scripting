#!/bin/bash

component=mysql
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
curl -s -L -o /etc/yum.repos.d/$component.repo https://raw.githubusercontent.com/stans-robot-project/$component/main/$component.repo &>> $logfile
status $?

echo -n "Installing the $component:"
yum install $component-community-server -y &>> $logfile
status $?

echo -n "Starting the $component:"
systemctl enable mysqld &>> $logfile
systemctl start mysqld
status $?

echo -n "Fetching default root password : "
DEFAULT_ROOT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk  '{print $NF}')
status $? 

# I want this to be executed only if the default password reset, was not done. 
echo "show databases;" | mysql -uroot -pRoboShop@1 &>> $logfile
if [ $? -ne 0 ] ; then 
    echo -n "Performing password reset of root user:"
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" | mysql --connect-expired-password -uroot -p${DEFAULT_ROOT_PASSWORD}   &>> $logfile
    status $?
fi 

echo "show plugins;" | mysql -uroot -pRoboShop@1 | grep validate_password &>> $logfile
if [ $? -eq 0 ] ; then 
    echo -n "Uninstalling the validate_password plugin :"
    echo "UNINSTALL PLUGIN validate_password;" | mysql -uroot -pRoboShop@1   &>> $logfile
    status $?
fi 


echo -n "Downloading the $component schema:"
curl -s -L -o /tmp/${$component}.zip "https://github.com/stans-robot-project/${component}/archive/main.zip"   &>> $logfile
status $? 

echo -n "Extracting the $component Schema:"
cd /tmp  
unzip -o /tmp/${component}.zip   &>> $logfile
status $? 

echo -n "Injecting the $component Schema :"
cd ${component}-main 
mysql -u root -pRoboShop@1 <shipping.sql &>> $logfile
status $? 