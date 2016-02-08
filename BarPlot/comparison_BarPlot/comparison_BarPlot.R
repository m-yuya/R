## -------------------------------------------------- 
## load data
## --------------------------------------------------

## read file data1
d1 <- read.table("./transport_time/transport_time_256byte.txt")
d1 <- d1[11:110,]
d2 <- read.table("./transport_time/transport_time_512byte.txt")
d2 <- d2[11:110,]
d3 <- read.table("./transport_time/transport_time_1Kbyte.txt")
d3 <- d3[11:110,]
d4 <- read.table("./transport_time/transport_time_2Kbyte.txt")
d4 <- d4[11:110,]
d5 <- read.table("./transport_time/transport_time_4Kbyte.txt")
d5 <- d5[11:110,]
d6 <- read.table("./transport_time/transport_time_8Kbyte.txt")
d6 <- d6[11:110,]
d7 <- read.table("./transport_time/transport_time_16Kbyte.txt")
d7 <- d7[11:110,]
d8 <- read.table("./transport_time/transport_time_32Kbyte.txt")
d8 <- d8[11:110,]
d9 <- read.table("./transport_time/transport_time_64Kbyte.txt")
d9 <- d9[11:110,]
d10 <- read.table("./transport_time/transport_time_128Kbyte.txt")
d10 <- d10[11:110,]
d11 <- read.table("./transport_time/transport_time_256Kbyte.txt")
d11 <- d11[11:110,]
d12 <- read.table("./transport_time/transport_time_512Kbyte.txt")
d12 <- d12[11:110,]
d13 <- read.table("./transport_time/transport_time_1Mbyte.txt")
d13 <- d13[11:110,]

## marge data.frames
data <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13) 

## define item's name
colnames(data) <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M")              

data1 <- data * 1000                    # convert unit from sec to msec

group1.median <- apply(data1, 2, median, na.rm = T)


## read file data1
d1 <- read.table("./transport_time2/transport_time_256byte.txt")
d1 <- d1[11:110,]
d2 <- read.table("./transport_time2/transport_time_512byte.txt")
d2 <- d2[11:110,]
d3 <- read.table("./transport_time2/transport_time_1Kbyte.txt")
d3 <- d3[11:110,]
d4 <- read.table("./transport_time2/transport_time_2Kbyte.txt")
d4 <- d4[11:110,]
d5 <- read.table("./transport_time2/transport_time_4Kbyte.txt")
d5 <- d5[11:110,]
d6 <- read.table("./transport_time2/transport_time_8Kbyte.txt")
d6 <- d6[11:110,]
d7 <- read.table("./transport_time2/transport_time_16Kbyte.txt")
d7 <- d7[11:110,]
d8 <- read.table("./transport_time2/transport_time_32Kbyte.txt")
d8 <- d8[11:110,]
d9 <- read.table("./transport_time2/transport_time_64Kbyte.txt")
d9 <- d9[11:110,]
d10 <- read.table("./transport_time2/transport_time_128Kbyte.txt")
d10 <- d10[11:110,]
d11 <- read.table("./transport_time2/transport_time_256Kbyte.txt")
d11 <- d11[11:110,]
d12 <- read.table("./transport_time2/transport_time_512Kbyte.txt")
d12 <- d12[11:110,]
d13 <- read.table("./transport_time2/transport_time_1Mbyte.txt")
d13 <- d13[11:110,]

## marge data.frames
data <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13) 

## define item's name
colnames(data) <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M")              

data2 <- data * 1000                    # convert unit from sec to msec

group2.median <- apply(data2, 2, median, na.rm = T)


## -------------------------------------------------- 
## plot function
## --------------------------------------------------

## merge data 
data <- rbind(group1.median, group2.median)

## graphic function
comparison_BarPlot <- function(data, ylim) {
    par(
        mar = c(5, 6, 2, 2), # margin about edge: default mar=c(5, 4, 4, 2) + 0.1
        mgp = c(3, 0.5, 0), # margin about label and scale: default mgp=c(3, 1, 0)
        cex.lab=1.8,                       # label font size
        cex.axis=1,2                         # axis font size
    )
    barplot(
        data,                                 # matrix data
        xlab="Data Size [byte]",             # x-axis label
        ylab="Latency [ms]",              # y-axis label
        ylim = c(0, ylim),                        # y-axis data span
        beside = TRUE,                             # comparison data 
        col = heat.colors(nrow(data))           # colors
    )
    ## legend
    legend(
        1, ylim,                      # position
        legend = c("data1", "data2"),   # labels
        cex = 1.5,                      # labels font size
        pt.cex = 3,                     # marker size
        pch = 22,                       # kinds of marker
        pt.bg = heat.colors(nrow(data)),    # box colors
        lty = 0,                               
        lwd = 0.6,                        # box-line width
        bg = "white"                    # background color
    )
}


## output file as eps
postscript("comparison_BarPlot.eps", horizontal = F, onefile = FALSE, paper = "special", width = 10, height = 6)
comparison_BarPlot(data, 5)
dev.off()

## output file as png
png("comparison_BarPlot.png", width = 600, height =400)
comparison_BarPlot(data, 5)
dev.off()


