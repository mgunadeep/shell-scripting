#!bin/bash

### Special variables gives special properties to your variables 

# Here are few of the special variabes :  $0 to $9 , $* , $@  $# , $$, $?

###  $0          : This gives the name of the script you're running 
###  $1 to $9    :You can pass a maximum of 9 variables from the command line when you're running the script 
###  $*          : Prints you all the supplied variables in the script 
###  $@          : Prints you all the supplied variables in the script 
###  $#          : Prints you the number of variables
###  $$          : Process ID of the script that you're running 
###  $?          : Gives you the exit code of the previous command 

echo $0   ### This prints the name of the script that you're executing. 
echo "Name of the script printed is $0"
### The above command prints the name of the script that is being executed.

echo "Name of the Applicant:- $1"
echo "Gender is $2"
echo "City is $3" 

### For the above three echo commands the input from the CLI should be,
### sh 06-SpecialVars.sh Guna Male Bangalore
###                       $1   $2    $3 ---> These are called Arguments or positional parameters.
### Here, we supplied 3 values...like that from the CLI, we can supply a maximum of 9 values.

# Lets, see another example for that.

name="$1"
echo "Hai, How are you $1?"
echo "Seems you look great today, $1"
echo "how is your health $1, are you feeling better?"
# Here, for the above script the value of the argument-'$1', has to be supplied from the CLI.