#!/bin/bash

name="Guna"
echo "Hello $name, Enter your preferred number from (1-7)!!"
read number 

case $number in 
      1) echo "Hello $name, you have selected $number and its corresponding day is Sunday"
        ;;
      2) echo "Hello $name, you have selected $number and its corresponding day is Monday"
        ;;
     3) echo "Hello $name, you have selected $number and its corresponding day is Tuesday"
     ;;
     4)echo "Hello $name, you have selected $number and its corresponding day is Wednesday"
     ;;
     5) echo "Hello $name, you have selected $number and its corresponding day is Thursday"
     ;;
     6) echo "Hello $name, you have selected $number and its corresponding day is friday"
     ;;
     7) echo "Hello $name, you have selected $number and its corresponding day is Saturday"
    esac

    