#install
install.packages('sentimentr')
install.packages('glue')
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming

#load
library("sentimentr")
library("tm")
library("SnowballC")

#aggregated sentiment analysis

sentiment_by('My life has become terrible since I met you and lost money', by = NULL)

#sentence-level sentiment analysis

sentiment('I am not very happy. He is very happy')

#extracting sentiment terms

'My life has become terrible since I met you and lost money' %>% extract_sentiment_terms()

#highlighting

'My life has become terrible since I met you and lost money. But I still have got a little hope left in me' %>% 
  sentiment_by(by = NULL) %>%
  highlight()

# Read the text file from local machine , choose file interactively
# filePath = "C:\Demos\AcmeCorp_EmpSurvey_CleanedPreparedData.txt"
text <- readLines(file.choose())

# Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Replacing "/", "@" and "|" with space
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("s", "company")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming - which reduces words to their root form
# docs <- tm_map(docs, stemDocument)

docs1 <- c(docs)

docs1

sentiment_by(docs1, by = NULL)
