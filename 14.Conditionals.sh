#!/bin/bash

### These conditionals are very significant, as using them makes our script more powerfull. Because they will elevate our scripts...by giving Evaluating and Decision-making powers to our scripts.  
### Generally, these are of 3 types. 
#1) Simple-if
#2) if-else
#3) else-if

#Let's see an exmaple of Simple-if statements,

echo "What is your age?"
read age
if [[ $age -ge 18 ]]; then
echo "You're officially a Major"
fi