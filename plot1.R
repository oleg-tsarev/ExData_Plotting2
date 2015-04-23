# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_2")
rm(list=ls())

# === read file === #
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# === processing ===#
aggr1 <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum,na.rm=T)
aggr1$x <- aggr1$x/1000000

# === plot ===#
plot(aggr1$Group.1,aggr1$x,type="o",xlab = "Year",
     ,ylab = "PM25 Emissions, 'Mln tons"
     ,main="Total PM25 Emissions in U.S.")

# === write to file === #
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()


