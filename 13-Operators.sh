# #!bin/bash

# #In Bash scripting, operators..are symbols or special keywords that allow you to perform various operations on data, variables, and expressions.
# They are used to manipulate values, make decisions, and perform calculations, making your scripts more powerful and flexible and increases the efficiency of your scripts.
### Expressions are categorized in to three types, they are...
# 1. Numbers, 2. Strings, 3. Files

# Bash provides several types of operators for different purposes. Let's explore the most common types of operators used in Bash scripting:

1. Arithmetic Operators:-
# -> Used for performing basic mathematical calculations.

# | Operator | Description                       | Example       | Result  |
# |----------|-----------------------------------|---------------|---------|
# | +        | Addition                          | $((2 + 3))    | 5       |
# | -        | Subtraction                       | $((5 - 2))    | 3       |
# | *        | Multiplication                    | $((4 * 6))    | 24      |
# | /        | Division                          | $((10 / 2))   | 5       |
# | %        | Modulus [gives remainder as o/p]  | $((7 % 3))    | 1       |
# | **       | Exponentiation:-[power]=2^3       | $((2 ** 3))   | 8       |

2. Comparison Operators:-
# -> Used for comparing values and testing conditions.
# ex:-[ 1 -eq 1 ] 
#     [ 1 -ne 2 ]

# | Operator  | Description               | Example                | Result  |
# |-----------|---------------------------|------------------------|---------|
# | ==        | Equal                     | $a == $b               | true    |
# | !=        | Not equal to              | $a != $b               | false   |
# | -eq       | Equal (numeric)           | $((2 + 3)) -eq 5       | true    |
# | -ne       | Not equal (numeric)       | $((2 + 3)) -ne 5       | false   |
# | -lt       | Less than (numeric)       | $a -lt $b              | true    |
# | -le       | Less than or equal to     | $a -le $b              | true    |
# | -gt       | Greater than (numeric)    | $a -gt $b              | false   |
# | -ge       | Greater than or equal to  | $a -ge $b              | false   |

3. Logical Operators:-
# -> Used for combining or negating conditions.

# | Operator | Description          | Example                 | Result  |
# |----------|----------------------|-------------------------|---------|
# | &&       | Logical AND          | $a -gt 5 && $b -lt 10   | true    |
# | ||       | Logical OR           | $a -lt 3 || $b -eq 7    | true    |
# | !        | Logical NOT          | ! $a -gt 5              | false   |

###--> Logical AND (&&):-
###    The logical AND operator (&&) will be true, only if both the conditions on its left and right sides are true. If any of the conditions is false, the result will be false.
### i.e condition-2(R.H.S) will be executed, only if condition-1(L.H.S) is true/successfull.
 
###--> Logical OR (||):-
###   The logical OR operator (||) will be true, if atleast one of the conditions on its left or right side is true. It returns false only when both conditions are false.
### i.e condition-2(R.H.S) will only be executed, only if condition-1(L.H.S) is false/failure.

###-->  Logical NOT (!):-
###   The logical NOT operator (!) negates the value of a condition. If the condition is true, the NOT operator makes it false, and vice versa.

4. String Operators:-
# -> Used for working with strings.

# | Operator | Description                     |         Example             | Result  |
# |----------|---------------------------------|-----------------------------|---------|
# |     =    | Equal to (string)               | if [ "$str1" = "$str2" ]    | true    |
# |    !=    | Not equal to (string)           | if [ "$str1" != "$str2" ]   | false   |
# |    -z    | checks if, it is- Empty string  | if [ -z "$str" ]            | true    |
# |    -n    | Non-empty string                | if [ -n "$str" ]            | false   |
# |     <    | Less than (string)              | $str1 < $str2               | true    |
# |     >    | Greater than (string)           | $str1 > $str2               | false   |

# [ -z "$var" ] -> This is true if var is not having any data.
# [ -n "$var" ] -> This is true if var is having any data.

#   -z and -n are inverse proportional options

5. File Test Operators:-
# -> Used for checking file properties.

# | Operator | Description                   | Example                | Result  |
# |----------|-------------------------------|------------------------|---------|
# | -e       | File exists                   | if [ -e "$file" ]      | true    |
# | -f       | Regular file                  | if [ -f "$file" ]      | true    |
# | -d       | Directory                     | if [ -d "$dir"  ]      | true    |
# | -r       | Readable file                 | if [ -r "$file" ]      | true    |
# | -w       | Writable file                 | if [ -w "$file" ]      | true    |
# | -x       | Executable file               | if [ -x "$file" ]      | true    |

    #[ -f file ] -> True, if file exists and file is a regular file.

    #[ -d xyz ]  -> True, if file exists and it is a directory.

    ### Explore the file types, There are 7 types of files in Linux.

