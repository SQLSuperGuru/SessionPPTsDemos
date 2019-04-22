# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("syuzhet") # for sentiment analysis
install.packages("ggplot2") # for plotting graphs
install.packages("tidyverse")

# Load
library("tm")
library("SnowballC")
library("syuzhet")
library("ggplot2")
library("tidyverse")

# Read the text file from local machine , choose file interactively
# filePath = "C:\Demos\AcmeCorp_EmpSurvey_CleanedPreparedData.txt"
text <- readLines(file.choose())

# head(text,10) - just to see top 10 lines

# run nrc sentiment analysis to return data frame with each row classified as one of the following
# emotions, rather than a score : 
# anger, anticipation, disgust, fear, joy, sadness, surprise, trust 
# and if the sentiment is positive or negative
d<-get_nrc_sentiment(text)

# head(d,10) - just to see top 10 lines
head (d,10)

#Transformation and  cleaning
#names(td_new)[1] <- "count"
#td_new <- cbind("sentiment" = rownames(td_new), td_new)
#rownames(td_new) <- NULL
#td_new2<-td_new[1:8,]

#Visualisation

barplot(
  sort(colSums(prop.table(d[, 1:8]))), 
  horiz = TRUE, 
  cex.names = 0.7, 
  las = 1, 
  main = "Emotions in Text", xlab="Percentage"
)

# regular sentiment score using get_sentiment() function and method of your choice
# please note that different methods may have different scales
syuzhet_vector <- get_sentiment(text, method="syuzhet")
head(syuzhet_vector)

bing_vector <- get_sentiment(text, method="bing")
head(bing_vector)

afinn_vector <- get_sentiment(text, method="afinn")
head(afinn_vector)



