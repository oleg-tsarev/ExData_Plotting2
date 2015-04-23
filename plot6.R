# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())
library(ggplot2)

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
SCC.motor <- SCC[grep("motor",SCC$Short.Name,ignore.case=T),]
aggr6 <- merge(SCC.motor,NEI[NEI$fips=="24510"|NEI$fips=="06037",],by="SCC")
aggr6 <- aggregate(aggr6$Emissions,by=list(aggr6$year,aggr6$fips),FUN=sum,na.rm=T)
names(aggr6) <- c("Year","City","Emissions")
aggr6$City <- ifelse(aggr6$City=="24510","Baltimore City","Los Angeles County")

# === plot ===#
qplot(Year,Emissions,data=aggr6,group=City,color=City
      ,xlab = "Year",ylab = "PM25 Emissions, tons"
      ,geom=c("line","smooth"),method="lm"
      ,main="PM25 Emissions from Motor Vehicle in Baltimore and LA")

# === write to file === #
dev.copy(png, file = "plot6.png",width=480,height=480)
dev.off()


