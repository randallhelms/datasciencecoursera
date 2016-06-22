# warning message example

log(-1)

# result: 
# [1] NaN
# Warning message:
# In log(-1) : NaNs produced

# simple function that can be used for debugging

printmessage <- function(x) {
  if (x>0)
      print("x is greater than zero")
  else
      print("x is less than or equal to zero")
  invisible(x) #prevents auto-printing
}

# new example function that accounts for NA values

printmessage2 <- function(x) {
  if (is.na(x))
    print("x is a missing value")
  else if (x >0 )
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x) #prevents auto-printing
}