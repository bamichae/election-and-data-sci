library(httr)
library(devtools,lib.loc="~/R/x86_64-pc-linux-gnu-library/3.3")
library(twitteR)
library(base64enc) #for encoding/decoding data
library(rjson)  #for converting to json
library(ROAuth)

api_key <- '###################'
api_secret <- '###################'
access_token <- '###################'
access_secret <- '###################'
setup_twitter_oauth(api_key,api_secret,access_token,access_secret)  #authorization with appropriate keys


tweetsForTrump <- searchTwitter('Donald+Trump', n= 1000)
tweetsForHillary <- searchTwitter('Hillary+Clinton', n=1000)

dfTrump <- twListToDF(tweetsForTrump)
dfHillary <- twListToDF(tweetsForHillary)

jTrump <- toJSON(dfTrump, method = "C")
jHillary <- toJSON(dfHillary, method = "C")

write(jTrump, file = "~/Desktop/JsonTrump.txt")
write(jHillary, file = "~/Desktop/JsonHillary.txt")
