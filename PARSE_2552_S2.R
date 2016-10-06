# Script to parse S200001 
# --- specifically : Hospital Name, CCN #, Provider Type, Type of Control 
# --- assumes you have a 'temp' table created by 'PARSE_2552_S8.R'

s2$VAL <- as.character(s2$VAL)

# For each unique (RPT #, subprovider) tuple
for(i in 1:nrow(temp)){
  x <- s2[s2$RPT_REC_NUM == temp$RPT_REC_NUM[i],]
  
  # get Hospital Name 
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$NAME[i] <- y$VAL[1]
  }
  
  # get CCN 
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 200,]
  if(nrow(y) > 0){
    temp$CCN[i] <- y$VAL[1]
  }
  
  # get Provider Type
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 400,]
  if(nrow(y) > 0){
    temp$TYPE_OF_PROVIDER[i] <- y$VAL[1]
  }
  
  # get Control Type
  y <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$TYPE_OF_CONTROL[i] <- y$VAL[1]
  }
  
  
  
}