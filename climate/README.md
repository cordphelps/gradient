---
title: "CIMIS.Rmd"
output:
  html_document:
    df_print: paged
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
library(RCurl)
# source.url <- c("https://raw.githubusercontent.com/cordphelps/gradient/master/climate/CIMIS/daily231.csv")
#nino <- read.csv(source.url, header=TRUE, row.names=NULL)

nino <- readRDS("/Users/rcphelps/code/thesis/climate/nino.rds")
library(skimr); 
skim(nino)

colnames(nino) <- c('station', 'date', 'julian', 'refETo', 'QCETo', 'precip', 'QCprecip', 
                       'solarRad', 'QCsolarRad', 'aveVaporPressure', 'QCaveVaporPressure', 
                       'maxAirTemp', 'QCmaxAirTemp', 'minAirTemp', 'QCminAirTemp',
                       'aveAirTemp', 'QCaveAirTemp', 'maxRelHumidity', 'QCmaxRelHumidity',
                       'minRelHumidity', 'QCminRelHumidity', 'aveRelHumidity', 'QCaveRelHumidity',
                       'dewPoint', 'QCdewPoint', 'aveWindSpeed', 'QCaveWindSpeed',
                       'windRun', 'QCwindRun', 'aveSoilTemp', 'QCaveSoilTemp')

saveRDS(nino, file="/Users/rcphelps/code/thesis/climate/nino.rds")
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=TRUE}
library(gridExtra)
library(ggplot2)

plot1 <- ggplot(data = nino) + geom_line(aes(y = dewPoint, x = julian), colour = "blue") + 
  geom_line(aes(y = maxAirTemp, x = julian), colour = "red") +
  geom_line(aes(y = minAirTemp, x = julian), colour = "green") +
  geom_line(aes(y = aveAirTemp, x = julian), colour = "blue") +
  ylim(0,90)
plot2 <- ggplot(data = nino) + geom_line(aes(y = aveVaporPressure, x = julian), colour = "blue") + 
  ylim(0,20)
plot3 <- ggplot(data = nino) + geom_line(aes(y = maxRelHumidity, x = julian), colour = "blue") +
  geom_line(aes(y = minRelHumidity, x = julian), colour = "red") +
  geom_line(aes(y = aveRelHumidity, x = julian), colour = "green") +
  ylim(0,100)
plot4 <- ggplot(data = nino) + geom_line(aes(y = aveSoilTemp, x = julian), colour = "blue") + 
  ylim(0,90)
grid.arrange(plot1, plot2, plot3, plot4)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
