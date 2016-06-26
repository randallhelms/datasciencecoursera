#example with new york mets

m_file <- "http://espn.go.com/mlb/team/_/name/nym/new-york-mets"

#pass XML data

nyMets <- htmlTreeParse(m_file,useInternal=TRUE)

#check game info

gameInfo <- xpathSApply(nyMets,"//div[@class='game-info']",xmlValue)

#check scores

scores <- xpathSApply(nyMets,"//div[@class='score']",xmlValue)

