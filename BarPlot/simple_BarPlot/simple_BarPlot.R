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

## marge data.frames
data <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13) 

## define item's name
colnames(data) <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M")              

data <- data[11:110,]                  # extract 100 samples from 120 samples
data <- data * 1000                    # convert unit from sec to msec

## calculate median
group.median <- apply(data,             # data
                      2,                # calculate each row  
                      median,           # median
                      na.rm = T)        # remove NA

## graphic function
simple_BarPlot <- function(data, ylim) {
    par(
        mar = c(5, 6, 2, 2), # margin about edge: default mar=c(5, 4, 4, 2) + 0.1
        mgp = c(3, 0.5, 0), # margin about label and scale: default mgp=c(3, 1, 0)
        cex.lab=1.8,                       # label font size
        cex.axis=1                         # axis font size
    )

    barplot(
        group.median,
        xlab="datasize [byte]",             # x-axis label
        ylab="latency [ms]",              # y-axis label
        ylim = c(0, ylim),
                                        #  col = c("gray", "yellow", "orange", "orangered", "darkred"),     # 各群に異なる色を付ける
        las = 3       # x軸の項目を縦にする
    )
}

## output file as eps
postscript("simple_BarPlot.eps", horizontal = F, onefile = FALSE, paper = "special", width = 10, height = 6)
simple_BarPlot(data, 5)
dev.off()

## output file as png
png("simple_BarPlot.png", width = 600, height =400)
simple_BarPlot(data, 5)
dev.off()

