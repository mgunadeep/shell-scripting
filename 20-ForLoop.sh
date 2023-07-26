#!/bin/bash

for variable in list;
do
    # commands to be executed for each value in the list
done


## variable "x" becomes every number in each iteration in the given "list" of "1 to 5".
# for x in 1,2,3,4,5;
# do 
#     echo $x
# done

# Example..
for x in {1..10};  #==> This is how, you declare a range.
do 
    echo $x
done

# for x in $(cat cities.txt);  #==> This is how, to give input from a file.
# do 
#     echo $x
# done

## 'Break' is to interrupt/stop the loop.
## 'Continue' means, it will literally, ignore/skip that specific loop given for x.