#!/bin/bash
appuser=roboshop
component=user
logfile=/tmp/$component.log

ID=$(id -u) 
if [ $ID -ne 0 ]; then
    echo -e "\e[31m You should be a root to perform this action or should obtain sudo previliages \e[0m"
    exit 1
fi

status () {
    if [ $1 -eq 0 ]; then
        echo -e "\e[32m success \e[0m"
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

id $appuser  &>> $logfile
if [ $? -ne 0 ]; then
    echo -n "Creating the service account:"
    useradd $appuser &>> $logfile
    status $?
fi

echo -n "Downloading the $component file:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip" &>> $logfile
status $?

echo -n "Unzipping..:"
cd /home/$appuser
rm -rf $component
unzip -o /tmp/$component.zip &>> $logfile
status $?

echo -n "Renaming the file:"
mv -f $component-main $component
status $?

echo -n "Changing the permissions:"
chown -R $appuser:$appuser $component
status $?

echo -n "Installing the necessary dependencies:"
cd /home/$appuser/$component
npm install  &>> $logfile
status $?

echo -n "Updating the systemD files:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' /home/$appuser/user/systemd.service
sed -i -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/' /home/$appuser/user/systemd.service
status $?

echo -n "Settingup the service with systemctl:"
mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
status $?

echo -n "Reloading the service:"
systemctl daemon-reload
status $?

echo -n "Enabling the $component:"
systemctl enable $component &>> $logfile
status $?

echo -n "Restarting the $component:"
systemctl restart $component
status $?

echo -n "Checking the $component status:"
systemctl status $component -l &>> $logfile
status $?




