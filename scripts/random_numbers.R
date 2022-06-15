### Random picking of numbers

setwd("~/Project_bioinformatics")

Random <-read.delim("DEGs.txt", header=F)
All <- Random[sample(nrow(Random), 823), ]
write.table(as.data.frame(All), "Random_823.txt", row.names=T, quote=FALSE, sep="\t")
