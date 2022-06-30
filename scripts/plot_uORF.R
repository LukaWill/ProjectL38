setwd("~/Project_bioinformatics/GALAXY!!!/Project_bioinformatics")
require(ggplot2)
library(RColorBrewer)
library(dplyr)

Metabolite <- read.delim("max_uORF.txt", comment.char = "#")

DEGup <- read.delim("up_uORF.txt", comment.char="#")

select_up<- which(Metabolite$GeneID%in%DEGup$GeneID)
Metabolite_select_up <- Metabolite[select_up,]
Metabolite_select_up$MaxuORF<-as.numeric(Metabolite_select_up$uORF)

Random <- read.delim("random_uORF.txt", comment.char="#")

select<- which(Metabolite$GeneID%in%Random$GeneID)
Metabolite_select_Random <- Metabolite[select,]
Metabolite_select_Random$MaxuORF<-as.numeric(Metabolite_select_Random$uORF)

DEGdown <- read.delim("down_uORF.txt", comment.char="#")

select_down<- which(Metabolite$GeneID%in%DEGdown$GeneID)
Metabolite_select_down <- Metabolite[select_down,]
Metabolite_select_down$MaxuORF<-as.numeric(Metabolite_select_down$uORF)


####  UP

bin_up_250<-subset(Metabolite_select_up,Metabolite_select_up$MaxuORF<=250)
bin_up_251_500<-subset(Metabolite_select_up,Metabolite_select_up$MaxuORF>250&Metabolite_select_up$MaxuORF<=500)
bin_up_501_750<-subset(Metabolite_select_up,Metabolite_select_up$MaxuORF>500&Metabolite_select_up$MaxuORF<=750)
bin_up_751_1000<-subset(Metabolite_select_up,Metabolite_select_up$MaxuORF>750&Metabolite_select_up$MaxuORF<=1000)
bin_up_1000<-subset(Metabolite_select_up,Metabolite_select_up$MaxuORF>1000)

bin_250_random<-subset(Metabolite_select_Random,Metabolite_select_Random$MaxuORF<=250)
bin_251_500_random<-subset(Metabolite_select_Random,Metabolite_select_Random$MaxuORF>250&Metabolite_select_Random$MaxuORF<=500)
bin_501_750_random<-subset(Metabolite_select_Random,Metabolite_select_Random$MaxuORF>500&Metabolite_select_Random$MaxuORF<=750)
bin_751_1000_random<-subset(Metabolite_select_Random,Metabolite_select_Random$MaxuORF>750&Metabolite_select_Random$MaxuORF<=1000)
bin_1000_random<-subset(Metabolite_select_Random,Metabolite_select_Random$MaxuORF>1000)

##DOWN

bin_down_250<-subset(Metabolite_select_down,Metabolite_select_down$MaxuORF<=250)
bin_down_251_500<-subset(Metabolite_select_down,Metabolite_select_down$MaxuORF>250&Metabolite_select_down$MaxuORF<=500)
bin_down_501_750<-subset(Metabolite_select_down,Metabolite_select_down$MaxuORF>500&Metabolite_select_down$MaxuORF<=750)
bin_down_751_1000<-subset(Metabolite_select_down,Metabolite_select_down$MaxuORF>750&Metabolite_select_down$MaxuORF<=1000)
bin_down_1000<-subset(Metabolite_select_down,Metabolite_select_down$MaxuORF>1000)

DEGs_up <- c(nrow(bin_up_250),nrow(bin_up_251_500),nrow(bin_up_501_750),nrow(bin_up_751_1000),nrow(bin_up_1000))
DEGs_up<-as.data.frame(DEGs_up)
Random <- c(nrow(bin_250_random),nrow(bin_251_500_random),nrow(bin_501_750_random),nrow(bin_751_1000_random),nrow(bin_1000_random))
Random <- as.data.frame(Random)

DEGs_down <- c(nrow(bin_down_250),nrow(bin_down_251_500),nrow(bin_down_501_750),nrow(bin_down_751_1000),nrow(bin_down_1000))
DEGs_down<-as.data.frame(DEGs_down)


pdf("uORF_numbers.pdf")
plot(DEGs_up$DEGs_up, col="orange", pch=19,
     main="uORF numbers",
     xlab="uORF length ",
     ylab="Number of transcripts with uORF", xaxt = "n",
     ylim=c(0,80))
axis(side=1, at = c(1, 2, 3, 4, 5),labels=c("250","251-500","501-750","751-1000",">1000"))
points(Random$Random, col="blue", pch=19)
points(DEGs_down$DEGs_down, col="red", pch=19)
legend('topright',legend=c("DEGs_up", "Random","DEGs_down"), pch=c(19, 19), col=c('orange', 'blue', 'red'))
dev.off()