#!bin/bash
### There are some variables, whose values gets changed withrespect to time. These are called as "Dynamic variables".
### These should not be hardcoded as their data/value gets changed too often. So,instead we should softcode them using expressions to dynamically represent the result by querying the data from the system.

user=$(whoami)
date=$(date)
directory=$(pwd)
echo "Hi, You're currently logged in as $user and today date is $date. Your Location in the system is $directory"

# For example,
echo -e "\e[32m Today's date is 22 Nov 2021 \e[0m"
# In the above line, we have hardcoded the value...So it prints the same date for every day, which is factually incorrect.

# So, now we'll softcode it and create an expression to dynamically query the info from system and can print the necessary data.
echo -e "\e[36m Today's date is $(date +%D) \e[0m"
# In the above command the string inside the paranthesis is called expression. The expression should always be enclosed in a Paranthesis.

# Like wise, we can also,dynamically see how many sessions are opened at any given moment.
echo The opened sessions right now are $(who | wc -l)
# In the above command we used pipe and passed the output from 1st command as input to 2nd command, where options wc=wordcounts and -l=print the newline counts.
