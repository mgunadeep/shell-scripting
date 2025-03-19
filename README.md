# shell-scripting
This repo is created to make novices more familiar, about automation using the shell-scripting. Shell is nothing, but an interpretor and it is native to linux. The main advantage of it, is..it doesn't need any extra layer for translation, unlike other languages. There are different shells in linux like Bash, zsh, fish. Generally, Bash comes as by default in many flavours of linux. But, depending upon your personal preference, you can choose/use any one. 

Things to remember, whn you're scripting:-
```
* When you develop something, ensure you run it twice before you confirm it as, 'WORKING'.
* There are no data types like (int, float, char, string) in bash scripting.
* Ensure, you remove the duplicate pieces of code.
* 'Validation'--should be given a very high priority. 
* Try to 'parameterize' the script and as much as possible, and make your script dynamic.
* When you put a hash at the starting, it will be reffered as "comment",its kind of like giving a description. A set of Comments are called as HereDoc. 
* When doing manually, you can switch user’s by giving the command  “sudo su - guna”. But,when automating a specific task by writing a script, you shouldn’t give the switch user “su - “ command in the script, as this breaks the execution of the script, and you need to sign-in again. So, Instead…you can change the ownership and permissions for that executing file.

```

