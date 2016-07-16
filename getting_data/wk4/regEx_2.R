#regular expression II (regEx)

#. is used to refer to any character

9.11 #will match 9-11 or 69.145 or 9:11 or whatever

#| is an 'or' in R

flood|fire #will match flood or fire

#alternatives can be real expressions and not just literals
#beginning of line with G/good OR B/bad somewhere in the line

^[Gg]ood|[Bb]ad

#parentheses can constrain the alternatives
#look at beginning of line, and HAS to have good or bad

^([Gg]ood|[Bb]ad)

#question mark indicates that expression is optional
#example: W is optional in this phrase
#have to escape (\) to make . a literal dot, not metacharacter

[Gg]eorge ( [Ww]\.)? [Bb]ush

#repetition metacharacters:
#* means any number, including none of item
#+ means at least one of the item

(.*) #means anything in between parentheses

[0-9]+ (.*)[0-9]+ #at least one number, followed by any number of characters, followed by at least one number again

#curly brackets {} let us specify minimum and maximum number of matches
  
[Bb]ush( +[^ ]+ +){1,5} debate #1 space, something else, 1 space, between 1 and 5 times

#{m,n} means at least m but not more than n matches
#m means exactly m matches
#m, means at least m matches

#use escaped numbers to refer to matched text, i.e. \1 \2

+([a-zA-Z]+) +\1 + #a space, at least 1 or more characters, then a space, then replication of phrase
  
#the * is greedy so it always matches longest possible string
  
^s(.*)s #starts with s, ends with s

#make it less greedy with question mark

^s(.*?)sS