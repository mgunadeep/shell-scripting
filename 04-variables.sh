#!bin/bash

### What is a variable?? Variable itself means-It changes, its not constant.
### A variable is used...to store or assaign the data/value and also to pass the values.

### In other Programming languages there are different datatypes like int,float,string. But, in Bash everything is a string by default and there is no concept of datatypes here.

### Syntax : $variableName : $ is going to print the value of the variable.

### This is how, we can declare the varibles in Bash.
g=7
d=11
echo $g
echo ${g}
### The above mentioned both syntaxes are also correct and can be used accordingly.
 
echo the respective values of the variables g and d are $g , $d 

k=14
j=
FOLDER_TO_DELETE=
echo the value of k is $k
echo $j
echo the value of j is $j
### If you try to print a variable that is not declared ahead, Bash will consider that as a null, instead of throwing you an error like others do. 

### If there is a specific variable which you don't want to declare or assaign a value ahead and you want to supply it later via CLI, you can do that with the 'export' command, but that specific value can be stored for that session only. Also remember you can only supply a specific value to a variable, but you cant declare whole variables through CLI, using the export command.
### Here j is an undeclared variable, and we did that so to supply the value later on for that variable.

### Let's see an another example for a variable.
name="Guna"
echo "Hello $name, how are you?"
sleep 0.5
echo "You look really nice, $name"
sleep 0.5
echo "$name Wanna hangout sometime?"

### For ex:-  "rm -rf /data/${FOLDER_TO_DELETE}/ = rm -rf /data" --> The meaning of this command is..it deletes the complete directory or the file under the data directory, as we have not declared that specific variable. So we should be mindfull of what we're executing.
