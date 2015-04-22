# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())
library(ggplot2)

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
SCC.motor <- SCC[grep("motor",SCC$Short.Name,ignore.case=T),]
aggr5 <- merge(SCC.motor,NEI[NEI$fips=="24510",],by="SCC")
aggr5 <- aggregate(aggr5$Emissions,by=list(aggr5$year),FUN=sum,na.rm=T)
names(aggr5) <- c("Year","Emissions")

# === plot ===#
qplot(Year,Emissions,data=aggr5,geom=c("point","line")
      ,xlab = "Year",ylab = "PM25 Emissions, tonns"
      ,main="Emissions in Baltimore from Motor Vehicle Sources")

# === write to file === #
dev.copy(png, file = "plot5.png",width=480,height=480)
dev.off()


