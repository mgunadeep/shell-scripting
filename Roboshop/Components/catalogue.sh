#!/bin/bash

component=catalogue
logfile=/tmp/$component.log
user=roboshop

ID=$(id -u)
if [ $ID -ne 0 ]; then 
    echo -e "\e[31m You should be a "root" to perform this action or should obtain, "sudo" privileages. \e[0m"
    exit 1
fi

status () {
    if [ $1 -eq 0 ]; then 
            echo -e "\e[32m Success \e[0m"
    else
            echo -e "\e[31m failure \e[0m"
            exit 2
    fi
}

echo -n "Configuring the repo"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $logfile
status $?

echo -n "Installing the nodejs.."
yum install nodejs -y &>> $logfile
status $?

id $user &>> $logfile
if [ $? -ne 0 ]; then              ### This function is written-to take care of exception handling. So, if the service accnt is already created it doesn't do anything. But, if the service account is not created it creates a new one.
echo -n "Creating a service account:"
useradd $user &>> $logfile
status $?
fi

echo -n "Downloading the $component code:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?

echo -n "Unzipping..."
cd /home/$user
rm -rf $component  &>> $logfile     ### This deletes the already downloaded component(catalogue) code file, so if the developer updates the code by adding new features...even before downloading a new file, it deletes the already existing or downloaded file,whhich contains the previous code.
unzip -o /tmp/$component.zip &>> $logfile
status $?

# echo -n "Modifying the ownership"
# chown -R $user:$user 
# status $?

echo -n "Renaming the file:"
mv $component-main $component
status $?

echo -n "Downloading the necessary dependencies"
cd /home/roboshop/catalogue
npm install  &>> $logfile
status $?


