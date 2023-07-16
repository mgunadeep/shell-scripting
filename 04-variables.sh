#!bin/bash

### What is a variable??
### A variable is used, to store or assaign the data and also to pass the values, later when required.

### In other Programming languages there are different datatypes like int,float,string. But, in Bash everything is a string by default and there is no concept of datatypes here.

### Syntax : $variableName : $ is going to print the value of the variable.

### This is how, we can declare the varibles in Bash.
g=7
d=11
echo $g
echo ${d}
### The above mentioned both syntaxes are also correct and can be widely accordingly.
 
echo the respective values of the variables g and d are $g , $d 

k=14
j=
FOLDER_TO_DELETE=
### If you try to print a variable that is not declared ahead, Bash will consider that as a null, instead of throwing you an error like others do, 
### For ex:-  "rm -rf /data/${FOLDER_TO_DELETE}/ = rm -rf /data" --> The meaning of this command is..it deletes the complete directory or the file under the data directory, as we have not declared that specific variable. So we should be in our senses of what we're executing.