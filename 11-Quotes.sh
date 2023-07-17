#!bin/bash

# In bash, output of your command changes, completely based on the quotes you use...
# " "   = Double Quotes 
# ' '   = Single Quotes 

a=53
echo "Value of a is ${a}"
echo Value of a is ${a}
echo 'Value of a is ${a}'

# When you use Single quotes, they consider the complete text enclosed by them as a string and prints it, Instead of considering the assaigned value/data to any variable present in that text.
# ' ' = single quotes always eliminate the power of the special variable in bash.