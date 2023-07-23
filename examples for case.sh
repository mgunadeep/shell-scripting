#!/bin/bash

name="Guna"
echo "Hello $name, Enter your preferred number from (1-7)!!"
read number 

case $number in 
      1) $number=1
        echo "It's Sunday"
        ;;
      2) $number=2
        echo "It's Monday"
        ;;
      3) $number=3  
        echo "Its Tuesday"
        ;;
    4) $number=4
    echo "Its Wednesday"
    ;;
    5) $number=5
    echo "its thursday"
    ;;
    6) $number=6
    echo "its friday"
    ;;
    7) $number=7
    echo "its saturday"
    ;;
    esac

    echo "Hello $name, you have selected $number and its coresponding day is "