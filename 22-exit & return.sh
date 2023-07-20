#!/bin/bash

### 'exit' command...comes out, from the execution of that script completely. And, we can also give/mention exit codes for a specific function or loop to know more about the execution status...like is it successfull or failed? So that, we can identify if there are any issues.
### While 'return' command just comes out, from that function or that specific loop.

### Let's see an exampe for exit using if-else statement.

### This is a script which is going to tell you, if you can win a battle with a beast using if-else conditional statement.
echo "The first battle with the beast starts, Get Ready..!!"
sleep 2
echo "Choose a number between 0 and 1 (0,1)?"
read  number
name=Guna
beast=$(( ($RANDOM % 2) ))

if [ $beast == $number ]; then
	echo "Hey $name, Congrats You have successfully defeated the beast"
else
	echo "Busted, Try again"
	exit 1   ###--> By using this, we can exit without executing the latter script 
fi

sleep 1

echo "Congrats You have passed Level-1, Now get ready to defeat MOROCUSS"
sleep 1
echo "Enter a number between 0 to 9 (0-9)"
read number
MOROCUSS=$(( ($RANDOM % 10) ))
if [ $MOROCUSS == $number ]; then
	echo "Whoo!!! $name you are really special and one in a lot, you finally won against MOROCUSS"
else
	echo "Better Luck, next time!"
fi


