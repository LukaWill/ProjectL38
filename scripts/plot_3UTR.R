setwd("~/Project_bioinformatics/GALAXY!!!/Project_bioinformatics")
require(ggplot2)
library(RColorBrewer)
library(dplyr)


Metabolite <- read.delim("max_3.txt", comment.char = "#")

DEGup <- read.delim("DEG_upregulation.txt", comment.char="#")

select_up<- which(Metabolite$GeneID%in%DEGup$GeneID)
Metabolite_select_up <- Metabolite[select_up,]
Metabolite_select_up$MaxUTR<-as.numeric(Metabolite_select_up$Max_3_UTR)

Randomup <- read.delim("Random_1009.txt", comment.char="#")

select_up<- which(Metabolite$GeneID%in%Randomup$GeneID)
Metabolite_select_upRandom <- Metabolite[select_up,]
Metabolite_select_upRandom$MaxUTR<-as.numeric(Metabolite_select_upRandom$Max_3_UTR)

DEGdown <- read.delim("DEG_downregulation.txt", comment.char="#")

select_down<- which(Metabolite$GeneID%in%DEGdown$GeneID)
Metabolite_select_down <- Metabolite[select_down,]
Metabolite_select_down$MaxUTR<-as.numeric(Metabolite_select_down$Max_3_UTR)

Randomdown <- read.delim("Random_1053.txt", comment.char="#")

select_down<- which(Metabolite$GeneID%in%Randomdown$GeneID)
Metabolite_select_downRandom <- Metabolite[select_down,]
Metabolite_select_downRandom$MaxUTR<-as.numeric(Metabolite_select_downRandom$Max_3_UTR)



####  UP

bin_up_250<-subset(Metabolite_select_up,Metabolite_select_up$MaxUTR<=250)
bin_up_251_500<-subset(Metabolite_select_up,Metabolite_select_up$MaxUTR>250&Metabolite_select_up$MaxUTR<=500)
bin_up_501_750<-subset(Metabolite_select_up,Metabolite_select_up$MaxUTR>500&Metabolite_select_up$MaxUTR<=750)
bin_up_751_1000<-subset(Metabolite_select_up,Metabolite_select_up$MaxUTR>750&Metabolite_select_up$MaxUTR<=1000)
bin_up_1000<-subset(Metabolite_select_up,Metabolite_select_up$MaxUTR>1000)

bin_up_250_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$MaxUTR<=250)
bin_up_251_500_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$MaxUTR>250&Metabolite_select_upRandom$MaxUTR<=500)
bin_up_501_750_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$MaxUTR>500&Metabolite_select_upRandom$MaxUTR<=750)
bin_up_751_1000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$MaxUTR>750&Metabolite_select_upRandom$MaxUTR<=1000)
bin_up_1000_random<-subset(Metabolite_select_upRandom,Metabolite_select_upRandom$MaxUTR>1000)

##DOWN

bin_down_250<-subset(Metabolite_select_down,Metabolite_select_down$MaxUTR<=250)
bin_down_251_500<-subset(Metabolite_select_down,Metabolite_select_down$MaxUTR>250&Metabolite_select_down$MaxUTR<=500)
bin_down_501_750<-subset(Metabolite_select_down,Metabolite_select_down$MaxUTR>500&Metabolite_select_down$MaxUTR<=750)
bin_down_751_1000<-subset(Metabolite_select_down,Metabolite_select_down$MaxUTR>750&Metabolite_select_down$MaxUTR<=1000)
bin_down_1000<-subset(Metabolite_select_down,Metabolite_select_down$MaxUTR>1000)

bin_down_250_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$MaxUTR<=250)
bin_down_251_500_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$MaxUTR>250&Metabolite_select_downRandom$MaxUTR<=500)
bin_down_501_750_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$MaxUTR>500&Metabolite_select_downRandom$MaxUTR<=750)
bin_down_751_1000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$MaxUTR>750&Metabolite_select_downRandom$MaxUTR<=1000)
bin_down_1000_random<-subset(Metabolite_select_downRandom,Metabolite_select_downRandom$MaxUTR>1000)

DEGs_up <- c(nrow(bin_up_250),nrow(bin_up_251_500),nrow(bin_up_501_750),nrow(bin_up_751_1000),nrow(bin_up_1000))
DEGs_up<-as.data.frame(DEGs_up)
Random_up <- c(nrow(bin_up_250_random),nrow(bin_up_251_500_random),nrow(bin_up_501_750_random),nrow(bin_up_751_1000_random),nrow(bin_up_1000_random))
Random_up <- as.data.frame(Random_up)

DEGs_down <- c(nrow(bin_down_250),nrow(bin_down_251_500),nrow(bin_down_501_750),nrow(bin_down_751_1000),nrow(bin_down_1000))
DEGs_down<-as.data.frame(DEGs_down)
Random_down <- c(nrow(bin_down_250_random),nrow(bin_down_251_500_random),nrow(bin_down_501_750_random),nrow(bin_down_751_1000_random),nrow(bin_down_1000_random))
Random_down <- as.data.frame(Random_down)


pdf("3_UTR_numbers.pdf")
plot(DEGs_up$DEGs_up, col="orange", pch=19,
     main="3'UTR numbers",
     xlab="3'UTR length",
     ylab="Number of transcripts with 3'UTRs", xaxt = "n",
     ylim=c(0,1000))
axis(side=1, at = c(1, 2, 3, 4, 5),labels=c("250","251-500","501-750","751-1000",">1001"))
points(Random_up$Random_up, col="blue", pch=19)
points(DEGs_down$DEGs_down, col="green", pch=19)
points(Random_down$Random_down, col="red", pch=19)
legend('topleft',legend=c("DEGs_up", "Random_up","DEGs_down","Random_down"), pch=c(19, 19), col=c('orange', 'blue','green', 'red'))
dev.off()