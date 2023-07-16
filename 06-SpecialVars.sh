#!bin/bash

# Special variables gives special properties to your variables 

# Here are few of the special variabes :  $0 to $9 , $* , $@  $# , $$, $?

#  $0          : This gives the name of the script you're running 
#  $1 to $9    :You can pass a maximum of 9 variables from the command line when you're running the script 
#  $*          : Prints you all the supplied variables in the script 
#  $@          : Prints you all the supplied variables in the script 
#  $#          : Prints you the number of variables
#  $$          : Process ID of the script that you're running 
#  $?          : Gives you the exit code of the previous command 

echo $0
echo "Name of the script printed is $0"
# The above command prints the name of the script that is being executed.