# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
aggr <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum,na.rm=T)
aggr$x <- aggr$x/1000000

plot(aggr$Group.1,aggr$x,type="l",xlab = "Year",
     ,ylab = "PM25 Emissions, mln tonns")


aggr


grDevices



library(RColorBrewer)
cols <- brewer.pal(3,"BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano,col=pal(20))




















write.csv(NEI, "./data/summarySCC_PM25.csv", row.names=T)

write.csv(SCC, "./data/Source_Classification_Code.csv", row.names=T)
