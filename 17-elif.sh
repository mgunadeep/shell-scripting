#!/bin/bash

# elif statement allows you to check additional conditions when the provided initial 'if statement' is false. 
# It's like providing an alternative plan, if the first plan doesn't work out.
# Elif is like...giving an another chance or rather, providing another set of conditions to the script to evaluate, like even if the above mentioned...'if statement' is false, so that you can now..come to elif to execute the conditions in it, without directly going for else.
# The elif statement can only be used, if you have "multiple/many conditions" to evaluate in a sequence.
# You can have multiple elif statements to check different conditions in sequence
# There is no closing for elif like (fi) in 'if statement'.


# The syntax for elif is...

    if [ expression 1 ] ; then
        
        command 1 

    elif [ expression 2 ] ; then 

        command 2 
    
    elif [ expression 3 ] ; then 

        command 3 
    
    else 
        
        command 4

    fi