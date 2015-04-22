# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
NEI <- NEI[NEI$fips=="24510",]
aggr2 <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum,na.rm=T)

# === plot ===#
plot(aggr2$Group.1,aggr2$x,type="o",xlab = "Year",
     ,ylab = "PM25 Emissions, tonns"
     ,main="Emissions in Baltimore City")

# === write to file === #
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()


