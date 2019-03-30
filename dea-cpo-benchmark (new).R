setwd("C:/Users/Elissyah/Documents/Elisa/kuliah/mata kuliah/skripsi/data/cpo")
data <- read.table("input-cpo-juta.txt",header=TRUE)

y=matrix(c(data$Q),length(data$Q),1);
y=t(y)
x=matrix(c(data$K, data$L, data$M, data$E),length(data$K),4);
x=t(x)

library(Benchmarking)
tev <- dea.boot(x, y, RTS = "vrs", ORIENTATION = "in", TRANSPOSE = TRUE)

n=ncol(x)
table.in=matrix(nrow=n,ncol=7)
table.in[,1]=c(1:n) #DMU number
table.in[,2]=tev$eff #DEA estimate for DMU n
table.in[,3]=tev$eff.bc #bias-corrected estimate for DMU n
table.in[,4]=tev$bias #amount of the bias for DMU n
table.in[,5]=tev$var  #variance measure of the bias
table.in[,6:7]=tev$conf.int  #confidence interval of the DEA estimate for DMU u

table.in[,2]=ifelse(nchar(table.in[,2])==1,
                    paste(table.in[,2],".",sep=""),
                    table.in[,2])

table.in[,2:7]=paste(table.in[,2:7],"000000",sep="")
table.in[,c(2:3,5:7)]=substr(table.in[,c(2:3,5:7)],1,6)
table.in[,4]=substr(table.in[,4],1,7)
table.in=paste(table.in[,1],"  ",
               table.in[,2],"  ",
               table.in[,3],"  ",
               table.in[,4],"  ",
               table.in[,5],"  ",
               table.in[,6],"  ",
               table.in[,7]," ",sep="")

outputfile=paste("tes",".txt",sep="");
write(table.in,outputfile)
