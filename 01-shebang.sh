#!bin/bash

echo Welcome to Shell-scripting.
#echo--> This command is used for printing the required text. In this case the above command just prints the text -- Welcome to shell-scripting.

## Start of the line in any bash script should always be a SHEBANG NOTATION.

## Apart from the first line, none of the lines are considered as shebang
## Shebang notatin should always start with #! 
## Here we're using "bash" so we used the syntax "#!bin/bash", if you're any other technology or different language like python, then it should be #!bin/python 

## Using this SHEBANG Notation, we are telling the system and the interpretor to use that specific language/technology run a particular script.

## Your server would have java, go , python, nodejs, shell installed. ( interpretor )

### Now if you run the script, how system will come to know which interpretor it has to use, that's where SHEBANG Notions helps

#### How to run a linux bash script ? 
    # *   bash scriptName.sh 
    # *   sh scriptName.sh 
    # *   ./scriptName

# Pringing Multiple Lines 
   echo Line1
   echo Line2
   echo Line3

# In bash, we have escape sequence characters and to enable it, use the option -e So,that we can add some power to the echo.

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