#!/bin/bash

COMPONENT=redis
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

echo -n  "Configuring the $COMPONENT repo :"
curl -s -L https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/${COMPONENT}.repo -o /etc/yum.repos.d/${COMPONENT}.repo
stat $? 

# echo -n "Installing $COMPONENT : "
# yum install -y ${COMPONENT}-6.2.11   &>> $LOGFILE
# stat $? 

# echo -n "Enabling the DB visibility :"
# sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/${COMPONENT}.conf
# sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/${COMPONENT}/${COMPONENT}.conf
# stat $? 

# echo -n "Starting $COMPONENT : "
# systemctl daemon-reload $COMPONENT      &>> $LOGFILE
# systemctl enable $COMPONENT      &>> $LOGFILE
# systemctl restart $COMPONENT       &>> $LOGFILE
# stat $?

