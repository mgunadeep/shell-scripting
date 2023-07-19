#!/bin/bash

### These conditionals are very significant, as using them makes our script more powerfull. Because they will ehance the efficiency of our scripts...by providing the Evaluating and Decision-making powers to our scripts.  
### Generally, these conditionals/conditions are of 3 types. 
#1) Simple-if
#2) if-else
#3) else-if

### The syntax of "Simple-if"/"if" , is as follows...

    #if [ expression ]; then
    #     command1
    #     command2
    #     command3
    # fi 
    
# If expression is true then it executes the commands.
# NOTE: If the expression is false, then it will do nothing.

### The Syntax of "if-else", is as follows...

#     if [ expression ]; then
#         command1
#         command2
#         command3
#     else 
#         commandx
#         commandy
#     fi 

# If expression is true then it executes the commands
# NOTE: If the expression is false, then it will perform the conditions in else.

### The Syntax of "else-if", is as follows...

#     if [ expression1 ]; then
#         command1
    
#     elif [expression2 ]; then
#         command2

#     elif  [expression3 ]; then
#         command3

#     else
#         command-x
#     fi 

