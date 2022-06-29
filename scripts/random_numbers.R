### Random picking of numbers

setwd("~/Project_bioinformatics/GALAXY!!!/Project_bioinformatics")

Random <-read.delim("DEGs.txt", header=F)
All <- Random[sample(nrow(Random), 1053), ]
write.table(as.data.frame(All), "Random_1053.txt", row.names=T, quote=FALSE, sep="\t")

