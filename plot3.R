# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())
library(ggplot2)

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
NEI <- NEI[NEI$fips=="24510",]
aggr3 <- aggregate(NEI$Emissions,by=list(NEI$type,NEI$year),FUN=sum,na.rm=T)
names(aggr3) <- c("Type","Year","Emissions")

# === plot ===#
qplot(Year,Emissions,data=aggr3,geom=c("point","line"),group=Type,color=Type
      ,xlab = "Year",ylab = "PM25 Emissions, tonns"
      ,main="Emissions in U.S. by Type")

# === write to file === #
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()


