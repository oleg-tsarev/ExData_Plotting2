# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
NEI <- NEI[NEI$fips=="24510",]
aggr2 <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum,na.rm=T)

aggr2

class(NEI$fips)

plot(aggr2$Group.1,aggr2$x,type="l",xlab = "Year",
     ,ylab = "PM25 Emissions, tonns")


aggr


grDevices



library(RColorBrewer)
cols <- brewer.pal(3,"BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano,col=pal(20))




















write.csv(NEI, "./data/summarySCC_PM25.csv", row.names=T)

write.csv(SCC, "./data/Source_Classification_Code.csv", row.names=T)
