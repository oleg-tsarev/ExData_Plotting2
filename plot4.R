# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())
library(ggplot2)

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
SCC.coal <- SCC[grep("coal",SCC$Short.Name,ignore.case=T),]
aggr4 <- merge(SCC.coal,NEI,by="SCC")
aggr4 <- aggregate(aggr4$Emissions,by=list(aggr4$year),FUN=sum,na.rm=T)
names(aggr4) <- c("Year","Emissions")
aggr4$Emissions <- aggr4$Emissions/1000

# === plot ===#
qplot(Year,Emissions,data=aggr4,geom=c("point","line")
      ,xlab = "Year",ylab = "PM25 Emissions,'Ths tons"
      ,main="PM25 Emissions from Coal Combustion Related Sources")

# === write to file === #
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()


