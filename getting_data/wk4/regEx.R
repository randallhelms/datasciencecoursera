#regEx (regular expressions) in R lesson

#literals match exact words

#regEx uses metacharacters to allow you to find:
#- whitespace word boundaries
#- sets of literals
#- beginning and end of a line
#- alternatives

#some metacharacters represent start of a line

^i think

#$ represents the end of a line

morning$
  
#list set of characters to accept at point in the match
  
[Bb][Uu][Ss][Hh]

#example: look at beginning of line to see capital or lower-case I

^[Ii] am

#specify range of characters or letter
#example: will look for a number then a letter

^[0-9][a-zA-Z]

#example: indicates matching characters not in indicated class

[^?/]$