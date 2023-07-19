#!/bin/bash

###Let's see an exmaple of Simple-if statement,

echo "What is your age?"
read age
if [[ $age -ge 18 ]]; then
echo "You're officially a Major"
fi