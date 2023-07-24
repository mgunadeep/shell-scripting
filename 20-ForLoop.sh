#!/bin/bash



# for x in 1,2,3,4,5
# do 
#     echo $x
# done

# for x in {1..10}
# do 
#     echo $x
# done

for x in $(cat cities.txt)
do 
    echo $x
done