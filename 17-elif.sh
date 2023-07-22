#!/bin/bash

# elif statement gives you the ability, to check additional conditions when the provided initial 'if statement' is false. 
# It's like providing an alternative plan(B,C,D..), if the first plan,(A) doesn't work out.
# Elif is like...giving an another chance or rather, providing another set of conditions to the script to evaluate/check, like even if the above mentioned...'if statement' is false, so that you can now..come to elif to execute the expression in it, without directly going for-else.
# If both the 'if' and 'elif' conditions are false, then the script executes the 'else' block as a fallback.
# The elif statement can only be used, if you have "multiple/many conditions" to evaluate in a sequence.
# You can have, multiple elif statements to check different conditions in sequence
# There is no closing for elif like (fi) in 'if statement'.


# The syntax for elif is...

    #   if [ expression 1 ]; then
        
    #         command 1 

    #   elif [ expression 2 ]; then 

    #         command 2 
    
    #   elif [ expression 3 ]; then 

    #         command 3 
    
    #   else 
        
    #         command 4

    #   fi
 
# Let's see an example for that

echo "What is your age?"
read age
if [ $age -le 12 ]; then
    echo "You're a kid"
    
elif [ $age -le 18 ]; then
    echo "You're a teenager"
elif [ $age -le 26 ]; then
    echo "You're a grownUp"
elif [ $age -le 59 ]; then
    echo "You're a Matured Adult"

else
     echo "You're a senior citizen"
fi

# This example demonstrates, how elif allows you to handle multiple conditions in a sequence, 
# making it easier to classify the age into different groups based on various ranges.



# NOTE:- What is the difference between a elif and nested-if conditionals???
# ==> In 'elif(else-if)' conditionals, we're not saying that..both the first 'if statement' and the 'elif statement' has to be true, But..instead we are saying that..Hey,if the first or above mentioned 'if statement' doesn't evaluate true, and if it is false,,
#        Well, Here's an another chance...else-if(elif) execute the expression with-in me, and then go for my next command. 
# ==> While in the 'nested-if' conditionals, both the 'parent-if' and 'nested-if' statements..should definitely has to be true, in order to-->proceed any futher, or, to execute-->the next conditions in the script.
