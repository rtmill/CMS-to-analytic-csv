# Script to parse S200001 
# --- specifically : Hospital Name, CCN #, Provider Type, Type of Control 
# --- assumes you have a 'temp' table created by 'PARSE_2552_S8.R'

s2$VAL <- as.character(s2$VAL)

rhcs <- s2[s2$LINE_NUM >= 1500 & s2$LINE_NUM < 1600,]

t2 <- unique(rhcs[c("RPT_REC_NUM", "LINE_NUM")])

t2$NAME <- ""
t2$CCN <- ""
t2$TYPE_OF_CONTROL <- ""

# TODO 
# t2$TYPE_OF_PROVIDER <- "" # Does not exist for RHCS


# For each unique (RPT #, subprovider) tuple
for(i in 1:nrow(t2)){
  x <- s2[s2$RPT_REC_NUM == t2$RPT_REC_NUM[i],]
  lineNum <- t2$LINE_NUM[i]
  
  # get Hospital Name 
  y <- x[x$LINE_NUM == lineNum & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    t2$NAME[i] <- y$VAL[1]
  }
  
  # get CCN 
  y <- x[x$LINE_NUM == lineNum & x$CLMN_NUM == 200,]
  if(nrow(y) > 0){
    t2$CCN[i] <- y$VAL[1]
  }
  
}

for(i in 1:nrow(t2)){
  x <- s2[s2$RPT_REC_NUM == t2$RPT_REC_NUM[i],]
  y <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    t2$TYPE_OF_CONTROL[i] <- y$VAL[1]
  }
}



# ------------------

# Parse subprovider number from line num ( 1500, 1501, 1502, etc.)

t2$SUBPROVIDER <- ""

for(i in 1:nrow(t2)){
  x <- as.integer(substr(t2$LINE_NUM[i], 3, 4)) +1
  t2$SUBPROVIDER[i] <- as.character(x)
}

# Merge data between S2 and S8 by RPT_REC_NUM and Subprovider index 

for(i in 1:nrow(temp)){
  x <- t2[t2$RPT_REC_NUM == temp$RPT_REC_NUM[i] & t2$SUBPROVIDER == temp$SUBPROVIDER[i],]
  if(nrow(x) > 0){
    temp$NAME[i] <- x$NAME[1]
    temp$CCN[i] <- x$CCN[1]
    temp$TYPE_OF_CONTROL[i] <- x$TYPE_OF_CONTROL[1]
  }
}










