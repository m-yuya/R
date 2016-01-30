## read file data
d1 <- read.table("./transport_time/transport_time_256byte.txt")
d2 <- read.table("./transport_time/transport_time_512byte.txt")
d3 <- read.table("./transport_time/transport_time_1Kbyte.txt")
d4 <- read.table("./transport_time/transport_time_2Kbyte.txt")
d5 <- read.table("./transport_time/transport_time_4Kbyte.txt")
d6 <- read.table("./transport_time/transport_time_8Kbyte.txt")
d7 <- read.table("./transport_time/transport_time_16Kbyte.txt")
d8 <- read.table("./transport_time/transport_time_32Kbyte.txt")
d9 <- read.table("./transport_time/transport_time_64Kbyte.txt")
d10 <- read.table("./transport_time/transport_time_128Kbyte.txt")
d11 <- read.table("./transport_time/transport_time_256Kbyte.txt")
d12 <- read.table("./transport_time/transport_time_512Kbyte.txt")
d13 <- read.table("./transport_time/transport_time_1Mbyte.txt")
#d14 <- read.table("./transport_time/transport_time_2Mbyte.txt")
#d15 <- read.table("./transport_time/transport_time_4Mbyte.txt")

## marge data.frames
data <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13) 

data <- data[11:110,]                  # extract 100 samples from 120 samples

data <- data * 1000                    # convert unit from sec to msec

## define item's name
colnames(data) <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M")              


## graphic function
simple_BoxPlot <- function(data) {
    par(
        mar=c(5,6,2,2),                     # margin
        font.lab=1,                        # label font
        font.axis=1,                       # axis font
        cex.lab=1.8,                        # label font size
        cex.axis=0.7                       # axis font size
    )
    boxplot(
        data,
        xlab="datasize [byte]",             # x-axis label
        ylab="latency [msec]",              # y-axis label
#        ylim=c(0, 6),                     # y-axis data span
        range = 0                          # include outliers into boxplot
    )
}


## output file as pdf
pdf("simple_BoxPlot.pdf")            # start rendering graph as "BoxPlot.pdf"
simple_BoxPlot(data)
dev.off()                               # close rendering

## output file as eps
postscript("simple_BoxPlot.eps", horizontal = F, width = 10, height = 6)
simple_BoxPlot(data)
dev.off()

## output file as png
png("simple_BoxPlot.png", width = 600, height =400)
simple_BoxPlot(data)
dev.off()

