#Direct to where input data is located and also to create the output
setwd("C:/Users/Skripsi")

data <- read.table("input.txt",header=TRUE)

#Create matrices for DEA input and ouput variables, then tranpose them
y=matrix(c(data$Q),length(data$Q),1); #Output
y=t(y)
x=matrix(c(data$K, data$L, data$M, data$E),length(data$K),4); #Input
x=t(x)

#Install Benchmarking package first from CRAN Project, then load it to use
library(Benchmarking)

#The syntax down below is use for calculating technical efficiency scores and the bootstraps,
#My thesis are using Variable Return to Scale approach and input orientation, hence the syntax "vrs" and "in"
tev <- dea.boot(x, y, RTS = "vrs", ORIENTATION = "in", TRANSPOSE = TRUE)

#Now we can create table which display columns of certain labels as below
n=ncol(x)
table.in=matrix(nrow=n,ncol=7)
table.in[,1]=c(1:n) #DMU number
table.in[,2]=tev$eff #DEA estimate for DMU n
table.in[,3]=tev$eff.bc #bias-corrected estimate for DMU n
table.in[,4]=tev$bias #amount of the bias for DMU n
table.in[,5]=tev$var  #variance measure of the bias
table.in[,6:7]=tev$conf.int  #confidence interval of the DEA estimate for DMU u

#These syntaxes below will print the output in text format
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
               table.in[,7],"  ",sep="")

outputfile=paste("output",".txt",sep="");
write(table.in,outputfile)
