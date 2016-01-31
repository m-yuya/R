## --------------------------------------------------
## simple_BoxPlot
## --------------------------------------------------

## read file data
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

data_simple <- data * 1000                    # convert unit from sec to msec

## define item's name
colnames(data_simple) <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M")              

## graphic function
simple_BoxPlot <- function(data){
    boxplot(
        data,
        xlab="datasize [byte]",        # x-axis label
        ylab="latency [ms]",           # y-axis label
        ylim=c(0, 1),                  # y-axis data span
        range = 0                      # include outliers into boxplot
    )
}

## --------------------------------------------------
## comparison_BoxPlot
## --------------------------------------------------

## read data file
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
d14 <- read.table("./transport_time/transport_time_2Mbyte.txt")
d14 <- d14[11:110,]
d15 <- read.table("./transport_time/transport_time_4Mbyte.txt")
d15 <- d15[11:110,]
data1 <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15) # bind data
data1<- data1 * 1000            # convert unit from sec to msec

## read data file
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
d14 <- read.table("./transport_time2/transport_time_2Mbyte.txt")
d14 <- d14[11:110,]
d15 <- read.table("./transport_time2/transport_time_4Mbyte.txt")
d15 <- d15[11:110,]
data2 <- cbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15) # bind data
data2<- data2 * 1000            # convert unit from sec to msec

data_comparison<- list(data1, data2)         # merge two data (data.frame) into a list

## define x-axis scale name
xaxis_scale <- c("256", "512", "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K", "1M", "2M", "4M")
box_cols <- c("pink", "lightcyan")                # box colors
## border_cols <- c("red", "blue")                   # box-line colrs
border_cols <- c("red", "blue")                   # box-line colors

## graphic function
comparison_BoxPlot <- function(all_data) {
    ## set parameters for graph
    par(
        xaxs="i"                      # x-axis data span has no margin
    )
    ## prepare graph feild
    plot(
        0, 0, type = "n",
        xlab = "Data Size [byte]", ylab = "Latency [ms]", # labels
        cex.lab = 1,                     # label font size
        font.lab = 1,                      # label font
        xlim = range(0:(ncol(data1) * 2)), # define large x-axis
        ylim = c(0, max(range(data1), range(data2))), # y-axis data span
        font.axis = 1,                                # axis font
        xaxt = "n"                                    # no x-axis
    )
    ## draw vertical line
    abline(
        v = c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28), # position
        lwd = 0.2                       # line width
    )
    ## draw boxplot
    for (i in 1:2){
        boxplot(
            all_data[[i]],
            at = c(1:ncol(data1)) * 2 + i - 2.5, # position of drawing boxplot
            border   = border_cols[i],                 # ボックス枠線の色
            col = box_cols[i],                       # colors
            xaxt = "n",                          # no x-axis scale
            range = 0,                           # no plot outliers 
            add = TRUE)
    }
    ## legend
    legend(
        1, 3.25,                      # position
        legend = c("data1", "data2"),   # labels
        cex = 1,                      # labels font size
        pt.cex = 2,                     # marker size
        pch = 22,                       # kinds of marker
        col = border_cols,              # box-line colors
        pt.bg = box_cols,               # box colors
        lty = 0,                               
        lwd = 0.6,                        # box-line width
        bg = "white"                    # background color
    )
    ## x-axis scale
    axis(
        1,                                    
        at = 1:length(xaxis_scale) * 2 - 1.0, # position of scale
        labels = xaxis_scale,                 # set scale name
        cex.axis = 1,                        # axis font size
        tick = TRUE                           
    )
}

## --------------------------------------------------
## multiple_BoxPlot
## --------------------------------------------------

## graphic function
multiple_BoxPlot <- function(data_simple, data_comparison) {

    ## define matrix for layout 
    ## | 1 1 2 2 3 3 | ----> | graph1 graph2 graph3 | 
    ## | 4 4 4 5 5 5 | ----> |   graph4    graph5   |
    mat <- matrix(c(1,1,2,2,3,3,4,4,4,5,5,5), 2, 6, byrow = TRUE)
    
    ## divide device region as matrix for multiple graph
    layout(mat)

    par(
        lwd = 0.6,           # line width
        mar = c(4, 4, 0, 0), # margin about edge: default mar=c(5, 4, 4, 2) + 0.1
        mgp = c(2, 0.5, 0), # margin about label and scale: default mgp=c(3, 1, 0)
        cex.lab = 1,        # label font size
        cex.axis = 1        # axis scale font size
    )
    simple_BoxPlot(data_simple)         # draw graph1
    simple_BoxPlot(data_simple)         # draw graph2
    simple_BoxPlot(data_simple)         # draw graph3
    comparison_BoxPlot(data_comparison) # draw graph4
    comparison_BoxPlot(data_comparison) # draw graph5
}

## output file as eps
postscript("multiple_BoxPlot.eps", horizontal = F, onefile = FALSE, paper = "special", width = 10, height = 6)
multiple_BoxPlot(data_simple, data_comparison)
dev.off()

## output file as png
png("multiple_BoxPlot.png", width = 1000, height =600)
multiple_BoxPlot(data_simple, data_comparison)
dev.off()

