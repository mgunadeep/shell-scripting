#!bin/bash

echo hello World
#echo--> This command is used, to print a required text. In this case the above command just prints the text -- Hello World

# Pringing Multiple Lines 
   echo Line1
   echo Line2
   echo Line3

# In bash, we have "escape sequence characters" and to enable it...use the option -e  So,that we can add some power to the echo.

# \n  : new line
# \t   : tab space                      

echo -e "Line1\nLine2"
### The above command prints the output as follows
### line1
### line2
echo -e "Line1\tLine2"
### The above command prints the output as follows
### line1   line2
echo -e "line1\n\tline2"
### The above command prints the output as follows
### line1
###     line2