#!/bin/bash

name="Guna"
echo "Hello $name, Enter your preferred number from (1-7)!!"
read number 

case $number in 
      1) $number=1
        "Sunday"
        ;;
      2) $number=2
      "Monday"
        ;;
      3) $number=3  
        "Tuesday"
        ;;
    4) $number=4
       "Wednesday"
        ;;
    5) $number=5
        "thursday"
       ;;
    6) $number=6
        "friday"
        ;;
    7) $number=7
       "saturday"
        ;;
    esac

    echo "Hello $name, you have selected $number and its coresponding day is "