library(XML)

#pass example

xemell <- "http://www.w3schools.com/xml/simple.xml"

#pass remote xml data to a variable

doc <- xmlTreeParse(xemell,useInternal=TRUE)

#wrapper element for the entire document

rootNode <- xmlRoot(doc)

#check the name to get the name from the node

xmlName(rootNode)

#check the names of the root node
#way to see the nested names of the root node

names(rootNode)

#directly access parts of root document w/ subset

rootNode[[1]]

#example no. 2
#i.e. 1st subcomponent of 1st subcomponent

rootNode[[1]][[1]]

#programmatically extract parts of the file
#this gets the xmlValue of every single tag

xmlSApply(rootNode,xmlValue)

#get more specific using XPath
#this example gets items on the menu

xpathSApply(rootNode,"//name",xmlValue)

#this example gets prices on the menu

xpathSApply(rootNode,"//price",xmlValue)