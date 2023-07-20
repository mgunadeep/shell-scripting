#!bin/bash

# Redirectors are of 2 types in bash.
#     1) Input Redirector   ( It means, to give an input from a file )       :  '<'          (Ex:- sudo mysql </tmp/studentapp.sql) == Here, the input for the DBcommand 'mysql' is given from the file named '/tmp/studentapp.sql'
#     2) Output Redirector  ( It means,routing the output to another file )  :  '>' or '1>'  (Ex:- pwd > output.txt) == Here, the output of the command 'pwd' is routed to another file named 'output.txt'

### --> Standardoutput(>):- Instead of displaying the output to the screen, if we want to store the ouput to a file, then we should use this STANDARDOUTPUT-redirector.
### --> standardinput(<) :- Instead of giving the input from keyboard, and if we want to give the input from a file, then we should use this STANDARDINPUT-redirector.

#  NOTE:-  '>>' [ This symbol means, it adds the latest output to the already existing content in that file, without overwriting ]

# Outputs :  
#     1) Standard Output 
#     2) Standard Error                 : 2> captures only the standard error   
#     3) Standard output and error      : &> This captures both errors and standard output 

ls -ltr > op.txt    # Redirects, the output to the file op.txt
ls -ltr >> op.txt   # Redirects, the output to the file op.txt file by appending to the already existing content.
ls -ltr &> op.txt   # Redirects, both standardOut and standardErrors to the file op.txt
ls -ltr &>> op.txt  # Redirects, both standardOut and standardErrors to the file op.txt by appending to the already existing content.
ls -ltr 2> op.txt   # Redirects, only the standard errors to the file op.txt 


# Each and every action in linux will have an exit which determines the status of the completion,
# Range of exit codes is 0 to 255 
# 0         :  successful 
# 1-255     :  partial failure / complete failure / partial sucess. 

# How do I come to know the exit code of the previously executed command ? ? ?
# ==> " echo $? "    


# 'Exit codes' also plays a key role in debugging big scripts.

# ==>> If you're dealing with a big script and if your script fails and it's really challenging to figure out the mistake, as it makes us to patiently observe the entire script from the beginning.
# Instead, we can use...exit codes everyWhere to find out where our script fails.
