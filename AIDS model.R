install.packages('micEconAids')
data("Blanciforti86")
data(Blanciforti86)
.libPaths()

library(micEconAids)
setwd("C:\\Users\\宛丘\\Desktop\\准雀\\论文-He Is We-4000")
data <- read.csv('data.csv')
#data2 <- read.csv('data2.csv')


#for (i in 1:nrow(data)){
#  data <- data[i,:]
#}

priceNames <- c('EPBR','EPRO','EPWHI','EPWHO','EBBR','EBRO','EBWHI','EBWHO')
shareNames <- c('PPBR','PPRO','PPWHI','PPWHO','PBBR','PBRO','PBWHI','PBWHO')
##最普通的  
laaidsResult <- aidsEst( priceNames, shareNames, "ET", data = data
                         )
print( laaidsResult )
summary( laaidsResult )
##method = "IL"
aidsResult <- aidsEst( priceNames, shareNames, "ET",
                       data = data, method = "IL" )
aidsMono( priceNames, "ET", coef = coef( aidsResult ),
          data = data )
print( aidsResult )
aidsResult[2]

##价格支出和弹性
pMeans <- colMeans( data[ , priceNames ] )
wMeans <- colMeans( data[ , shareNames ] )
aidsResultElas <- aidsElas( coef( aidsResult ), prices = pMeans,
                            shares = wMeans )
print( aidsResultElas )








aidsElas( coef, prices = NULL, shares = NULL, totExp = NULL )
coef