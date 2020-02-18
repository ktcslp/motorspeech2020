#This script calculates Shannon entropy at the word level as an index of lexical diversity
#(Cunningham & Haley, in press). Thank you to Tyler Rinker and the R package of qdap. This 
#script simply calculates the measure on all the text files in the working directory.

library(qdap)
fileNames = dir(pattern = ".txt")
for (fileName in fileNames){
  sample <- readChar(fileName, file.info(fileName)$size)
  df <- diversity(sample)
  write.table(c(fileName, df), file="dataaphasia.csv", append=TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
}