# script to Parse 222-92 Worksheet S-3


both <- read.csv("temp/both2011.csv")
both$VAL <- as.character(both$VAL)

s3 <- subset(both,  grepl(glob2rx("S0*3") , WKSHT_CD) )

s3$VAL <- as.character(s3$VAL)
temp <- unique(s3[c("RPT_REC_NUM", "WKSHT_CD")])

temp$WKSHT_CD <- as.character(temp$WKSHT_CD)
temp$SUBPROVIDER <- "x"
for(i in 1:nrow(temp)){
  temp$SUBPROVIDER <- substr(temp$WKSHT_CD, 5, 6)
}


temp$NAME <- ""
temp$CITY <- ""
temp$STATE <- ""
temp$ZIP <- ""
temp$COUNTY <- ""
temp$CCN <- ""
temp$TYPE_OF_CONTROL <- ""
temp$TYPE_OF_PROVIDER <- ""


temp$RCVD_EXCPT_PROD_STANDARD <- "" # as of now, this is all NA 
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

temp$OPERATE_AS_OTHER_SUN_FROM <- ""
temp$OPERATE_AS_OTHER_SUN_TO <- ""
temp$OPERATE_AS_OTHER_MON_FROM <- ""
temp$OPERATE_AS_OTHER_MON_TO <- ""
temp$OPERATE_AS_OTHER_TUE_FROM <- ""
temp$OPERATE_AS_OTHER_TUE_TO <- ""
temp$OPERATE_AS_OTHER_WED_FROM <- ""
temp$OPERATE_AS_OTHER_WED_TO <- ""
temp$OPERATE_AS_OTHER_THU_FROM <- ""
temp$OPERATE_AS_OTHER_THU_TO <- ""
temp$OPERATE_AS_OTHER_FRI_FROM <- ""
temp$OPERATE_AS_OTHER_FRI_TO <- ""
temp$OPERATE_AS_OTHER_SAT_FROM <- ""
temp$OPERATE_AS_OTHER_SAT_TO <- ""

temp$CONSOLIDATED <- "Y"


for(i in 1:nrow(temp)){
  x <- s3[s3$RPT_REC_NUM == temp$RPT_REC_NUM[i] & s3$WKSHT_CD == temp$WKSHT_CD[i],]
  
  # get name
  y <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$NAME[i] <- y$VAL[1]
  }
  
  # get City
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$CITY[i] <- y$VAL[1]
  }
  
  # get State 
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 200,]
  if(nrow(y) > 0){
    temp$STATE[i] <- y$VAL[1]
  }
  
  # get Zip 
  y <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 300,]
  if(nrow(y) > 0){
    temp$ZIP[i] <- y$VAL[1]
  }
  
  # get County 
  y <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$COUNTY[i] <- y$VAL[1]
  }
  
  # get Provider Number 
  y <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$CCN[i] <- y$VAL[1]
  }
  
  # get OPERATE AS OTHER
  y <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$OPERATE_AS_OTHER[i] <- y$VAL[1]
  }
  
  # get OPERATE AS OTHER TYPE
  y <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 100,]
  if(nrow(y) > 0){
    temp$OPERATE_AS_OTHER_TYPE[i] <- y$VAL[1]
  }
  
  # --- START hours of operation --- 
  
  # get OPERATION HOURS
 
  
  # SUN
  y <- x[x$LINE_NUM == 1101,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SUN_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SUN_TO[i] <- z$VAL[1]
  }
  
  # MON
  y <- x[x$LINE_NUM == 1102,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_MON_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_MON_TO[i] <- z$VAL[1]
  }
  
  # TUE
  y <- x[x$LINE_NUM == 1103,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_TUE_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_TUE_TO[i] <- z$VAL[1]
  }
  
  # WED
  y <- x[x$LINE_NUM == 1104,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_WED_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_WED_TO[i] <- z$VAL[1]
  }
  
  # THU
  y <- x[x$LINE_NUM == 1105,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_THU_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_THU_TO[i] <- z$VAL[1]
  }
  
  # FRI
  y <- x[x$LINE_NUM == 1106,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_FRI_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_FRI_TO[i] <- z$VAL[1]
  }
  
  # SAT
  y <- x[x$LINE_NUM == 1107,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SAT_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_RHC_SAT_TO[i] <- z$VAL[1]
  }
  
  # -----------START - HOURS OF OPERATION - OTHER---------
  
  
  # SUN
  y <- x[x$LINE_NUM == 1201,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_SUN_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_SUN_TO[i] <- z$VAL[1]
  }
  
  # MON
  y <- x[x$LINE_NUM == 1202,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_MON_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_MON_TO[i] <- z$VAL[1]
  }
  
  # TUE
  y <- x[x$LINE_NUM == 1203,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_TUE_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_TUE_TO[i] <- z$VAL[1]
  }
  
  # WED
  y <- x[x$LINE_NUM == 1204,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_WED_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_WED_TO[i] <- z$VAL[1]
  }
  
  # THU
  y <- x[x$LINE_NUM == 1205,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_THU_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_THU_TO[i] <- z$VAL[1]
  }
  
  # FRI
  y <- x[x$LINE_NUM == 1206,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_FRI_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_FRI_TO[i] <- z$VAL[1]
  }
  
  # SAT
  y <- x[x$LINE_NUM == 1207,]
  
  z <- y[y$CLMN_NUM == 100,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_SAT_FROM[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200,]
  if(nrow(z) > 0){
    temp$OPERATE_AS_OTHER_SAT_TO[i] <- z$VAL[1]
  }
  
  
  
}