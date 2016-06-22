# write function that takes two arguments:
#   1. 2-character abbreviation of a state
#   2. outcome name

best1 <- function(state,outcome) {
  
  # read outcome data
  
  od  <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available", stringsAsFactors = FALSE)[,c(2,7,11,17,23)]

  #set state
  
  states <- unique(od$state)
  
  #set outcomes
  
  oc <- od[,3:5]  
  
  #set names
  
  names(od) <- c("hospital","state","heart attack","heart failure","pneumonia")  

  #check validity
  
  if (!state %in% od$state) {
    stop("invalid state")
  }   
  
  if (!((outcome == "heart attack") | (outcome == "heart failure")
            | (outcome == "pneumonia"))) {
    stop ("invalid outcome")
  }
  
#return outcome column
  
  oc_col <- if(outcome == "heart attack") {3}
  else if(outcome == "heart failure") {4}
  else if(outcome == "pneumonia") {5}
 
  #return result
  
  od[,oc_col] <- suppressWarnings(as.numeric(levels(od[, oc_col])[od[, oc_col]]))
  od[, 2] <- as.character(od[, 2])
  statedata <- od[grep(state, od$state), ]
  orderdata <- statedata[order(statedata[, oc_col], statedata[, 2], na.last = NA), ]
  orderdata[1, 2]  
}