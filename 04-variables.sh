#!/bin/bash

### What is a variable?? Variable itself means- 'It changes and is not constant'.
### A variable is used...to store or assaign a specific data/value and also used to pass the values, later on when required in the script/programm.
### Variable should never start with a number.
### You ‘SHOULD’ definitely declare the variable at the start, or else it’s going to take it as null value, while executing that file.
### In other Programming languages, there are different datatypes like int,float,char,string. But, in Bash everything is a string by default and there is no concept of datatypes here.
### when you enclose any variable in single quotes, it will print the variable name as it is. That also means, single quotes will elimiate the special variables power.
### $a or ${a} or "${a}"--> All these are same. 

# In Bash scripting, there are 3 main types of variables:

# 1. Local Variables:-
#==> These Variables are like small pieces of information that are used only within specific 'functions' or 'scripts', that you write. 
# They are like little notes that are only seen and used by the function, where they are written.
# Once the function finishes, the variable is gone and can't be accessed outside of that specific function.
# Ex:- 
#      Let's see an example of local variable i.e $name in the Car function, 
Car () {
    local name="Ferrari 488 GTB!"
    echo "I love, $name!"
}
Car                 #==> Output:-  I love, Ferrari 488 GTB!!

echo "Name=$name"   #==> Output:-  Name=
# As, you can see we tried to print the data in the variable by giving the command--> $name, But it din't give the expected output, as it's a local variable and can't really be used outside of that specific function.



# 2. Environment Variables:-
#==> These Variables are like the information, that is shared...among all the programs and scripts that are running on your computer. 
# They are like the important messages posted on a big bulletin board, available for everyone to see.
# These variables, can be accessed by any script or program, that is running on your computer as long as you set it using the 'export' command.
# Ex:-
  export tweet="Hello, This is my first tweet!"
  echo $tweet  # Output: Hello, This is my first tweet!

  

# 3. Shell Variables:
#==> These variables are like special notes, that the [bash,zsh,fish] Shell-(the program that interprets your commands) writes down for itself. 
# They are like reminders...for the shell to remember certain things.
# $USER, $HOME, and $SHELL are shell variables. They hold information about the current user, home directory, and the type of shell you are using.
# Ex:-
   echo "Current User: $USER"
   echo "Home Directory: $HOME"
   echo "Current Shell: $SHELL"


# NOTE:- Bash variables are used to store information, and you don't need to declare their type. 
# So, finally to give you a gist for all this--> Local variables are used within a 'specific function', Environment variables are 'shared among all programs and scripts', and Shell variables are a 'special reminders for the shell itself'. 
# These variables, make your 'scripts' more powerful and flexible by allowing you to store and use data more efficiently.


### Syntax : $variableName : $ is going to print the value of the variable.

### This is how, we can declare the varibles in Bash.
g=7
d=11
echo $g      ### Both syntaxes, with & without braces are also correct and can be used accordingly.
echo ${g}
echo the respective values of the variables g and d are $g , $d 

k=14
j=
FOLDER_TO_DELETE=
echo the value of k is $k
echo $j
echo the value of j is $j
### Here j is an undeclared variable, and we did that so to supply the value later on for that variable.

# NOTE:- 1) If you try to print a variable that is not declared ahead, Bash will consider that as a null, instead of throwing you an error like others do. 
#        2) If there is a specific variable which you don't want to declare or assaign a value ahead and you want to supply it later via CLI, you can do that with the 'export' command, but that specific value can be stored for that session only.
#              also remember you can only supply a specific value to a variable, but you can't declare whole variables through CLI, using the export command.


### Let's see an another example for a variable.
name="Guna"
echo "Hello $name, how are you?"
sleep 0.5  #--> Sleep 0.5 = take a gap of 0.5 sec
echo "You look really nice, $name"
sleep 0.5
echo "$name Wanna hangout sometime?"
### Here if you want to change the name, you don't have to manually do it..for everyline. Instead, we can simply change the data/value for the above declared variable.

### For ex:-  "rm -rf /data/${FOLDER_TO_DELETE}/ = rm -rf /data" --> The meaning of this command is..it deletes the complete directory or the file under the data directory, as we have not declared that specific variable. So we should be mindfull of what we're executing.
