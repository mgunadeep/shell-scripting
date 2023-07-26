#!/bin/bash


## x becomes every number in each iteration in the given list of 1 to 5.
# for x in 1,2,3,4,5
# do 
#     echo $x
# done

# Below, is how you declare a range, 
for x in {1..10};   ## ==>> For variable-"x" in the "list" {1 to 10}
do 
    echo $x
done

# for x in $(cat cities.txt)
# do 
#     echo $x
# done

## 'Break' is to interrupt/stop the loop.
## 'Continue' means...that it will literally, ignore/skip that specific loop given for x 