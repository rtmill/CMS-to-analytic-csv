# script to Parse 2552-10 Worksheet S-8
# - Assumes that you have a table of S8*R* worksheets labeled "s8" 

s8$VAL <- as.character(s8$VAL)
temp <- unique(s8[c("RPT_REC_NUM", "WKSHT_CD")])

temp$WKSHT_CD <- as.character(temp$WKSHT_CD)
temp$SUBPROVIDER <- "x"
for(i in 1:nrow(temp)){
  temp$SUBPROVIDER <- substr(temp$WKSHT_CD, 3, 3)
}

temp$WKSHT_CD <- as.factor(temp$WKSHT_CD)

temp$NAME <- ""
temp$CITY <- ""
temp$STATE <- ""
temp$ZIP <- ""
temp$COUNTY <- ""
temp$CCN <- ""
temp$TYPE_OF_CONTROL <- ""
temp$TYPE_OF_PROVIDER <- ""


temp$RCVD_EXCPT_PROD_STANDARD <- ""
temp$OPERATE_AS_OTHER <- ""
temp$OPERATE_AS_OTHER_TYPE <- ""

temp$OPERATE_AS_RHC_SUN_FROM <- ""
temp$OPERATE_AS_RHC_SUN_TO <- ""
temp$OPERATE_AS_RHC_MON_FROM <- ""
temp$OPERATE_AS_RHC_MON_TO <- ""
temp$OPERATE_AS_RHC_TUE_FROM <- ""
temp$OPERATE_AS_RHC_TUE_TO <- ""
temp$OPERATE_AS_RHC_WED_FROM <- ""
temp$OPERATE_AS_RHC_WED_TO <- ""
temp$OPERATE_AS_RHC_THU_FROM <- ""
temp$OPERATE_AS_RHC_THU_TO <- ""
temp$OPERATE_AS_RHC_FRI_FROM <- ""
temp$OPERATE_AS_RHC_FRI_TO <- ""
temp$OPERATE_AS_RHC_SAT_FROM <- ""
temp$OPERATE_AS_RHC_SAT_TO <- ""

temp$CONSOLIDATED <- ""



# For each unique (RPT #, subprovider) tuple
for(i in 1:nrow(temp)){
  x <- s8[s8$RPT_REC_NUM == temp$RPT_REC_NUM[i] & s8$WKSHT_CD == temp$WKSHT_CD[i],]
  
  
  # get City
  y <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$CITY[i] <- y$VAL[1]
  }
  
  # get State 
  y <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 200,]
  if(nrow(y) > 0){
    temp$STATE[i] <- y$VAL[1]
  }
  
  # get Zip 
  y <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 300,]
  if(nrow(y) > 0){
    temp$ZIP[i] <- y$VAL[1]
  }
  
  # get County 
  y <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 400,]
  if(nrow(y) > 0){
    temp$COUNTY[i] <- y$VAL[1]
  }
  
  
  # get receieved exception from productivity standard
  y <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$RCVD_EXCPT_PROD_STANDARD[i] <- y$VAL[1]
  }
  
  # get consolidated? (boolean)
  y <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$CONSOLIDATED[i] <- y$VAL[1]
  }
  
  # get OPERATE AS OTHER
  y <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$OPERATE_AS_OTHER[i] <- y$VAL[1]
  }
  
  # get OPERATE AS OTHER TYPE
  y <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 200,]
  if(nrow(y) > 0){
    temp$OPERATE_AS_OTHER_TYPE[i] <- y$VAL[1]
  }
  
  # --- START hours of operation --- 
  
  # get OPERATION HOURS
  y <- x[x$LINE_NUM == 1100,]
  
  # SUN
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SUN_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SUN_TO[i] <- z$VAL[1]
  }
  
  # MON
  z <- y[y$CLMN_NUM == 300,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_MON_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 400,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_MON_TO[i] <- z$VAL[1]
  }
  
  # TUE
  z <- y[y$CLMN_NUM == 500,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_TUE_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 600,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_TUE_TO[i] <- z$VAL[1]
  }
  
  # WED
  z <- y[y$CLMN_NUM == 700,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_WED_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 800,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_WED_TO[i] <- z$VAL[1]
  }
  
  # THU
  z <- y[y$CLMN_NUM == 900,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_THU_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 1000,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_THU_TO[i] <- z$VAL[1]
  }
  
  # FRI
  z <- y[y$CLMN_NUM == 1100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_FRI_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 1200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_FRI_TO[i] <- z$VAL[1]
  }
  
  # SAT
  z <- y[y$CLMN_NUM == 1300,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SAT_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 1400,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SAT_TO[i] <- z$VAL[1]
  }
  
  
}
