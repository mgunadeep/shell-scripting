#!/bin/bash

### Let's see an example for if-else...

echo "Do you love automobiles (y/n)"
read automobiles
if [ $automobiles == "y" ]; then
    echo "Congrats, You're a Petrolhead"
else 
    echo "Sorry!! You're not"
fi