

year <- "2014"



# ----- 222-92 ----- #

# --- CREATE WORKING FILES --- # 


if( !file.exists(file=paste(c("src/hclinic_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("independent alpha not found")
}
if( !file.exists(file=paste(c("src/hclinic_", year, "_NMRC.CSV"),collapse="")) ){
  cat("independent nmrc not found")
}

alpha <- read.csv(file=paste(c("src/hclinic_", year, "_ALPHA.CSV"),collapse="") , header=FALSE)
nmrc <- read.csv(file=paste(c("src/hclinic_", year, "_NMRC.CSV"),collapse="") , header=FALSE)

#Numeric table
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_VAL_NUM")

# Alpha table
names(alpha) <-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_ALPHNMRC_ITM_TXT")
nmrc$ITM_VAL_NUM <- as.factor(nmrc$ITM_VAL_NUM)
x <- names(alpha)
x[5] <- "VAL"
names(alpha) <- x
names(nmrc) <- x

both <- rbind.data.frame(alpha, nmrc)

rm(nmrc, alpha, x)


# --- #



# ---------- MAP DATA TO SPEC ----------#


# Import working file and call mapping scripts
#------------------------------
#both <- read.csv(file=paste(c("src/both",year,".csv"),collapse=""))

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
#write.csv(build, file=paste(c("mapped/wc_",year,".csv"),collapse=""),row.names=FALSE )
c <- build

# Run script to map worksheet b
source('PARSE_B.R')
#write.csv(build, file=paste(c("mapped/wb_",year,".csv"),collapse=""),row.names=FALSE )
b <- build

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
#write.csv(build, file=paste(c("mapped/wa_",year,".csv"),collapse=""),row.names=FALSE )
a <- build

# Run script to map worksheet s, parts I & II
source('PARSE_S.R')
#write.csv(build, file=paste(c("mapped/ws_",year,".csv"),collapse=""),row.names=FALSE )
s1 <- build

# Run script to map worksheet s, part III
source('PARSE_S32.R')
#write.csv(temp, file=paste(c("mapped/ws3_",year,".csv"),collapse=""),row.names=FALSE )
s3 <- build


rm(both, build, tmp, x, y, z, i)



# -- end 222-92 --- 






# -----------  2552-10  ---------- #

# --- CREATE WORKING FILES --- # 


issues = FALSE
if( !file.exists(file=paste(c("src/hosp10_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("provider alpha not found")
  issues = TRUE
}
if( !file.exists(file=paste(c("src/hosp10_", year, "_NMRC.CSV"),collapse="")) ){
  cat("provider nmrc not found")
  issues = TRUE
}

if(issues){
  return()
}


alpha <- read.csv(file=paste(c("src/hosp10_", year, "_ALPHA.CSV"),collapse=""), header=FALSE)
nmrc <- read.csv(file=paste(c("src/hosp10_", year, "_NMRC.CSV"),collapse=""), header=FALSE)
#Numeric table
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","VAL")
nmrc$VAL <- as.factor(nmrc$VAL)

# Alpha table
names(alpha) <- names(nmrc)

both <- rbind.data.frame(alpha, nmrc)
both$LINE_NUM <- as.integer(both$LINE_NUM)
both$CLMN_NUM <- as.integer(both$CLMN_NUM)



rm(nmrc, alpha, x)




s8 <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
#write.csv(res, file=paste(c("src/s8_", year, ".csv"),collapse=""), row.names = FALSE)


m <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
#write.csv(res,  file=paste(c("src/m_", year, ".csv"),collapse=""), row.names = FALSE)


s2 <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
#write.csv(res, file=paste(c("src/s2_", year, ".csv"),collapse=""), row.names = FALSE)


rm(both)


#s8 <- read.csv(file=paste(c("src/s8_", year, ".csv"),collapse=""))
source('PARSE_2552_S8.R')
#s2 <- read.csv(file=paste(c("src/s2_", year, ".csv"),collapse=""))
source('PARSE_2552_S2.R')
s8 <- temp
rm(s2)
#write.csv(temp, file=paste(c("mapped/ws8_2552_",year,".csv"),collapse=""), row.names = FALSE)


# m <- read.csv(file=paste(c("src/m_", year, ".csv"),collapse=""))
source('PARSE_2552_M1.R')
m1 <- temp
#write.csv(temp, file=paste(c("mapped/wm1_2552_",year,".csv"),collapse=""), row.names = FALSE)
source('PARSE_2552_M2.R')
m2 <- temp
#write.csv(temp, file=paste(c("mapped/wm2_2552_",year,".csv"),collapse=""), row.names = FALSE)
source('PARSE_2552_M3.R')
m3 <- temp
#write.csv(temp, file=paste(c("mapped/wm3_2552_",year,".csv"),collapse=""), row.names = FALSE)


rm(temp)


# ---------- MERGE -------------#


# ----  stats  -----
source('merge_s1_s8s2.R')
write.csv(ret, file=paste(c("Combined/stats_",year,".csv"),collapse=""), row.names=FALSE)

# ------- costs -------
source('merge_a_m1.R')
write.csv(ret, file=paste(c("Combined/costs_",year,".csv"),collapse=""), row.names=FALSE)

# ------ visits ------
source('merge_b_m2.R')
write.csv(ret, file=paste(c("Combined/visits_",year,".csv"),collapse=""), row.names= FALSE)

# ---- payments ----       
source('merge_c_m3.R')
write.csv(ret, file=paste(c("Combined/payments",year,".csv"),collapse=""), row.names=FALSE)
