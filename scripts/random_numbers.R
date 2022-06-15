### Random picking of numbers

setwd("")

Random <-read.delim("RIBO_random.txt", header=F)
All <- Random[sample(nrow(Random), 212), ]
write.table(as.data.frame(All), "All_212.xls", row.names=T, quote=FALSE, sep="\t")

