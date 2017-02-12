setwd("D:/Work/R-Projects/Xlsx")
base=read.csv('data.txt',header=TRUE, sep='\t', quote = "\'")


require(xlsx)
# example of reading xlsx sheets
file <- system.file("tests", "test_import.xlsx", package = "xlsx")
res <- read.xlsx(file, 2) # read the second sheet
# example of writing xlsx sheets
file <- paste(tempfile(), "xlsx", sep=".")
write.xlsx(USArrests, file=file)
