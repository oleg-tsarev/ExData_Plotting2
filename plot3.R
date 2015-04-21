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
qplot(Year,Emissions,data=aggr3,geom="line",group=Type,color=Type)






#qplot(year,Emissions,data=NEI,facets=.~type,geom=c("point","smooth"))
#qplot(year,Emissions,data=NEI,facets=.~type,geom="line")
qplot(year,Emissions,data=NEI,geom="line",fill=type)
aggr3

qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"),
      fill=gear, main="Mileage by Gear Number",
      xlab="", ylab="Miles per Gallon")

qplot(n, x, geom="line", colour="darkgreen") + geom_line(data =
data.frame(n , x = y), colour="red")
head(NEI)



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
