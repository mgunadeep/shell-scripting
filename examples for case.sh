#!/bin/bash

# name="Guna"
# echo "Hello $name, Enter your preferred number from (1-7)!!"
# read number 

# case $number in 
#       1) echo "Hello $name, you have selected $number and its corresponding day is Sunday"
#          ;;
#       2) echo "Hello $name, you have selected $number and its corresponding day is Monday"
#          ;;
#       3) echo "Hello $name, you have selected $number and its corresponding day is Tuesday"
#        ;;
#        4)echo "Hello $name, you have selected $number and its corresponding day is Wednesday"
#          ;;
#        5) echo "Hello $name, you have selected $number and its corresponding day is Thursday"
#      ;;
#      6) echo "Hello $name, you have selected $number and its corresponding day is friday"
#      ;;
#      7) echo "Hello $name, you have selected $number and its corresponding day is Saturday"
#     esac



echo "Enter two numbers, and the operation you want to perform"
read $1 and $2
read operator

case $1,$2,$operator in
     1) echo "Adding the two numbers" 
     $(( $1 + $2 )) 
     ;;
     2) echo "subtracting the two numbers" 
     $(( $1-$2 ))
     ;;
     3) echo "Multipying the two numbers"
        $(( $1 * $2 ))
        ;;
     4) echo  "Dividing the two numbers"
        $(( $1 / $2 ))
        ;;
 esac