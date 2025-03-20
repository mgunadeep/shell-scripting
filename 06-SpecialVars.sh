#!/bin/bash

### Special variables gives special properties to your variables 

# Here are few of the special variabes :  $0 to $9 , $* , $@  $# , $$, $?
# Arguments--> input values that you pass via CLI to a script when executing it.

###  $0        : This gives the name of the script you're executing.
###  $1 to $9  : You can pass a maximum of '9' arguments via the CLI, 
###  $*        : Prints you, all the arguments as a single string/treats all arguments as one.
###  $@        : Prints you, all the arguments as separate words/preserves spaces in arguments.
###  $#        : Prints you, the total number(count) of Arguments-(that you have supplied via CLI).
###  $$        : Prints you, the process-PID of the current script,you're executing.
###  $!        : Prints you, the Last background process-PID
###  $?        : Gives you, the exit code of the previous/Last command.

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

# Lets, see another example of conversational script.
name="$1,$2,$3"
echo "Hai, How are you $1?"
echo "Seems you look great today, $2"
echo "how is your health $3, are you feeling better?"
# Here, for the above script the value of the arguments-$1,$2,$3 has to be supplied from the CLI while executing the script.
