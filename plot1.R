## Read in the files
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# sum up emissions by year in kilotons
emissionsbyyear <- summarise(group_by(NEI, year), emissions=sum(Emissions)/1000)

# generate the png graph
png(filename='./plot1.png')
# plot it
barplot(emissionsbyyear$emissions, names.arg = emissionsbyyear$year,
        col = c("red"), main="Total Emissions of PM 2.5", xlab = 'Year',
        ylab = 'PM 2.5 Emissions in Kilotons')

dev.off()
