setwd("~/Project_bioinformatics/GALAXY!!!/Project_bioinformatics")
require(ggplot2)
library(RColorBrewer)
library(dplyr)


Metabolite <- read.delim("max_transcript.txt", comment.char = "#")

DEGup <- read.delim("DEG_upregulation.txt", comment.char="#")

select_up<- which(Metabolite$GeneID%in%DEGup$GeneID)
Metabolite_select_up <- Metabolite[select_up,]
Metabolite_select_up$Maxtranscript<-as.numeric(Metabolite_select_up$max_transcript)

Randomup <- read.delim("Random_1009.txt", comment.char="#")

select_up<- which(Metabolite$GeneID%in%Randomup$GeneID)
Metabolite_select_upRandom <- Metabolite[select_up,]
Metabolite_select_upRandom$Maxtranscript<-as.numeric(Metabolite_select_upRandom$max_transcript)

DEGdown <- read.delim("DEG_downregulation.txt", comment.char="#")

select_down<- which(Metabolite$GeneID%in%DEGdown$GeneID)
Metabolite_select_down <- Metabolite[select_down,]
Metabolite_select_down$Maxtranscript<-as.numeric(Metabolite_select_down$max_transcript)

Randomdown <- read.delim("Random_1053.txt", comment.char="#")

select_down<- which(Metabolite$GeneID%in%Randomdown$GeneID)
Metabolite_select_downRandom <- Metabolite[select_down,]
Metabolite_select_downRandom$Maxtranscript<-as.numeric(Metabolite_select_downRandom$max_transcript)



####  UP

bin_up_5000<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript<=5000)
bin_up_5001_10000<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript>5000&Metabolite_select_up$Maxtranscript<=10000)
bin_up_10001_15000<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript>10000&Metabolite_select_up$Maxtranscript<=15000)
bin_up_15001_20000<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript>15000&Metabolite_select_up$Maxtranscript<=20000)
bin_up_20001_25000<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript>20000&Metabolite_select_up$Maxtranscript<=250000)
bin_up_25001<-subset(Metabolite_select_up,Metabolite_select_up$Maxtranscript>250000)

bin_up_5000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript<=5000)
bin_up_5001_10000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript>5000&Metabolite_select_upRandom$Maxtranscript<=10000)
bin_up_10001_15000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript>10000&Metabolite_select_upRandom$Maxtranscript<=15000)
bin_up_15001_20000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript>15000&Metabolite_select_upRandom$Maxtranscript<=20000)
bin_up_20001_25000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript>20000&Metabolite_select_upRandom$Maxtranscript<=250000)
bin_up_25001_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$Maxtranscript>250000)
##DOWN

bin_down_5000<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript<=5000)
bin_down_5001_10000<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript>5000&Metabolite_select_down$Maxtranscript<=10000)
bin_down_10001_15000<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript>10000&Metabolite_select_down$Maxtranscript<=15000)
bin_down_15001_20000<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript>15000&Metabolite_select_down$Maxtranscript<=20000)
bin_down_20001_25000<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript>20000&Metabolite_select_down$Maxtranscript<=250000)
bin_down_25001<-subset(Metabolite_select_down,Metabolite_select_down$Maxtranscript>250000)

bin_down_5000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript<=5000)
bin_down_5001_10000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript>5000&Metabolite_select_downRandom$Maxtranscript<=10000)
bin_down_10001_15000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript>10000&Metabolite_select_downRandom$Maxtranscript<=15000)
bin_down_15001_20000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript>15000&Metabolite_select_downRandom$Maxtranscript<=20000)
bin_down_20001_25000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript>20000&Metabolite_select_downRandom$Maxtranscript<=250000)
bin_down_25001_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$Maxtranscript>250000)

DEGs_up <- c(nrow(bin_up_5000),nrow(bin_up_5001_10000),nrow(bin_up_10001_15000),nrow(bin_up_15001_20000),nrow(bin_up_20001_25000),nrow(bin_up_25001))
DEGs_up<-as.data.frame(DEGs_up)
Random_up <- c(nrow(bin_up_5000_random),nrow(bin_up_5001_10000_random),nrow(bin_up_10001_15000_random),nrow(bin_up_15001_20000_random),nrow(bin_up_20001_25000_random),nrow(bin_up_25001))
Random_up <- as.data.frame(Random_up)

DEGs_down <- c(nrow(bin_down_5000),nrow(bin_down_5001_10000),nrow(bin_down_10001_15000),nrow(bin_down_15001_20000),nrow(bin_down_20001_25000),nrow(bin_down_25001))
DEGs_down<-as.data.frame(DEGs_down)
Random_down <- c(nrow(bin_down_5000_random),nrow(bin_down_5001_10000_random),nrow(bin_down_10001_15000_random),nrow(bin_down_15001_20000_random),nrow(bin_down_20001_25000_random),nrow(bin_down_25001))
Random_down <- as.data.frame(Random_down)


pdf("Transcript_numbers.pdf")
plot(DEGs_up$DEGs_up, col="orange", pch=19,
     main="Transcript numbers",
     xlab="Transcript length (x 1000)",
     ylab="Number of transcripts", xaxt = "n",
     ylim=c(0,800))
axis(side=1, at = c(1, 2, 3, 4, 5, 6),labels=c("<5","5-10","10-15","15-20","20-25", ">25"))
points(Random_up$Random_up, col="blue", pch=19)
points(DEGs_down$DEGs_down, col="green", pch=19)
points(Random_down$Random_down, col="red", pch=19)
legend('topleft',legend=c("DEGs_up", "Random_up","DEGs_down","Random_down"), pch=c(19, 19), col=c('orange', 'blue','green', 'red'))
dev.off()