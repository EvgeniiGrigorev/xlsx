setwd("D:/Work/R-Projects/R/xlsx")

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_121') # for 64-bit version
library(rJava)

library(xlsx)

# Reading xlsx sheets
datDir <- c("D:/Work/R-Projects/R/xlsx")
files <- list.files(datDir, pattern = ".xlsx",full.names=T)

for (i in seq_along(files)) {
  assign(paste("base", i, sep = "_"), read.xlsx(files[i],1,as.data.frame=TRUE, 
                                                header=TRUE, stringsAsFactors=FALSE))
}

files[1]

# Read the second sheet, Header = True
base_2 <- read.xlsx(files[1],2)



head(base_2)


# Writing xlsx sheets
file <- paste(tempfile(), "xlsx", sep=".")
write.xlsx(base_2, file=file)

# Find

find.java <- function() {
  for (root in c("HLM", "HCU")) for (key in c("Software\\JavaSoft\\Java Runtime Environment", 
                                              "Software\\JavaSoft\\Java Development Kit")) {
    hive <- try(utils::readRegistry(key, root, 2), 
                silent = TRUE)
    if (!inherits(hive, "try-error")) 
      return(hive)
  }
  hive
}

find.java()
