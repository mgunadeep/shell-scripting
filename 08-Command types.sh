#!/bin/bash

# There are 4 types of commands available : 

# 1) Binary                   ( /bin , /sbin )
# 2) Aliases                  ( Alises are shortcuts,  alias net="netstat -tulpn" )
# --> But, these aliases are temporary in nature i.e they would be gone after you signoff. So, to make them permanent we have to add these aliases in to bash_profile.
#     In linux, every user has their own shell profile in their(user's) home directory called as ~/.bash_profile. You have to add these aliases in that profile to make these permanent.
# 3) Shell Built-in Commands  
# 4) Functions                # Functions are nothing but a set of command that can be written in a sequence and can be called 'n' number of times as per your choice.
