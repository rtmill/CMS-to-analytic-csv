

year <- "2011"




# --- CREATE WORKING FILES --- # 


if( !file.exists(file=paste(c("src/hclinic_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("independent alpha not found")
}
if( !file.exists(file=paste(c("src/hclinic_", year, "_NMRC.CSV"),collapse="")) ){
  cat("independent nmrc not found")
}
if( !file.exists(file=paste(c("src/hclinic_", year, "_RPT.CSV"),collapse="")) ){
  cat("independent rpt not found")
}

hclinic_ALPHA <- read.csv(file=paste(c("src/hclinic_", year, "_ALPHA.CSV"),collapse="") , header=FALSE)
hclinic_NMRC <- read.csv(file=paste(c("src/hclinic_", year, "_NMRC.CSV"),collapse="") , header=FALSE)
hclinic_RPT <- read.csv(file=paste(c("src/hclinic_", year, "_RPT.CSV"),collapse="") , header=FALSE)

#Report table
rpt <- hclinic_RPT
names(rpt) <- c("RPT_REC_NUM", "PRVDR_CTRL_TYPE_CD", "PRVDR_NUM", "NPI", "RPT_STUS_CD",
                "FY_BGN_DT","FY_END_DT", "PROC_DT", "INITL_RPT_SW", "LAST_RPT_SW", "TRANSMTL_NUM",
                "FI_NUM", "ADR_VNDR_CD", "FI_CREATE_DT", "UTIL_CD", "NPR_DT", "SPEC_IND","FI_RCPT_DT"
)

#Numeric table
nmrc <- hclinic_NMRC
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_VAL_NUM")

# Alpha table
alpha <- hclinic_ALPHA
names(alpha) <-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_ALPHNMRC_ITM_TXT")
nmrc$ITM_VAL_NUM <- as.factor(nmrc$ITM_VAL_NUM)
x <- names(alpha)
x[5] <- "VAL"
names(alpha) <- x
names(nmrc) <- x

both <- rbind.data.frame(alpha, nmrc)

write.csv(both, file=paste(c("src/both",year,".csv"),collapse=""), row.names = FALSE)

# --- #



rm(list=ls())
year <- "2011"



# ---  2552-10  ---- #

issues = FALSE
if( !file.exists(file=paste(c("src/hosp10_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("provider alpha not found")
  issues = TRUE
}
if( !file.exists(file=paste(c("src/hosp10_", year, "_NMRC.CSV"),collapse="")) ){
  cat("provider nmrc not found")
  issues = TRUE
}
if( !file.exists(file=paste(c("src/hosp10_", year, "_RPT.CSV"),collapse="")) ){
  cat("provider rpt not found")
  issues = TRUE
}

if(issues){
  return()
}


hclinic_ALPHA <- read.csv(file=paste(c("src/hosp10_", year, "_ALPHA.CSV"),collapse=""), header=FALSE)
hclinic_NMRC <- read.csv(file=paste(c("src/hosp10_", year, "_NMRC.CSV"),collapse=""), header=FALSE)
hclinic_RPT <- read.csv(file=paste(c("src/hosp10_", year, "_RPT.CSV"),collapse=""), header=FALSE)


#Report table
rpt <- hclinic_RPT
names(rpt) <- c("RPT_REC_NUM", "PRVDR_CTRL_TYPE_CD", "PRVDR_NUM", "NPI", "RPT_STUS_CD",
                "FY_BGN_DT","FY_END_DT", "PROC_DT", "INITL_RPT_SW", "LAST_RPT_SW", "TRANSMTL_NUM",
                "FI_NUM", "ADR_VNDR_CD", "FI_CREATE_DT", "UTIL_CD", "NPR_DT", "SPEC_IND","FI_RCPT_DT"
)

#Numeric table
nmrc <- hclinic_NMRC
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_VAL_NUM")

# Alpha table
alpha <- hclinic_ALPHA
names(alpha) <-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_ALPHNMRC_ITM_TXT")
nmrc$ITM_VAL_NUM <- as.factor(nmrc$ITM_VAL_NUM)
x <- names(alpha)
x[5] <- "VAL"
names(alpha) <- x
names(nmrc) <- x


both <- rbind.data.frame(alpha, nmrc)



res <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
write.csv(res, file=paste(c("src/s8_", year, ".csv"),collapse=""), row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res,  file=paste(c("src/m_", year, ".csv"),collapse=""), row.names = FALSE)


res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, file=paste(c("src/s2_", year, ".csv"),collapse=""), row.names = FALSE)


rm(list=ls())

year = "2011"





# ---------- MAP DATA TO SPEC ----------#


# Import working file and call mapping scripts
#------------------------------
both <- read.csv(file=paste(c("src/both",year,".csv"),collapse=""))

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, file=paste(c("mapped/wc_",year,".csv"),collapse=""),row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, file=paste(c("mapped/wb_",year,".csv"),collapse=""),row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, file=paste(c("mapped/wa_",year,".csv"),collapse=""),row.names=FALSE )

# Run script to map worksheet s, parts I & II
source('PARSE_S.R')
write.csv(build, file=paste(c("mapped/ws_",year,".csv"),collapse=""),row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, file=paste(c("mapped/ws3_",year,".csv"),collapse=""),row.names=FALSE )




rm(list=ls())

year = "2011"


s8 <- read.csv(file=paste(c("src/s8_", year, ".csv"),collapse=""))
source('PARSE_2552_S8.R')
s2 <- read.csv(file=paste(c("src/s2_", year, ".csv"),collapse=""))
source('PARSE_2552_S2.R')
write.csv(temp, file=paste(c("mapped/ws8_2552_",year,".csv"),collapse=""), row.names = FALSE)


m <- read.csv(file=paste(c("src/m_", year, ".csv"),collapse=""))
source('PARSE_2552_M1.R')
write.csv(temp, file=paste(c("mapped/wm1_2552_",year,".csv"),collapse=""), row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, file=paste(c("mapped/wm2_2552_",year,".csv"),collapse=""), row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, file=paste(c("mapped/wm3_2552_",year,".csv"),collapse=""), row.names = FALSE)




rm(list=ls())

year = "2011"



# ---------- MERGE -------------#


# ----  stats  -----
s1 <- read.csv(file=paste(c("mapped/ws_",year,".csv"),collapse=""), stringsAsFactors = FALSE)
s3 <- read.csv(file=paste(c("mapped/ws3_",year,".csv"),collapse=""), stringsAsFactors = FALSE)
s8 <- read.csv(file=paste(c("mapped/ws8_2552_",year,".csv"),collapse=""), stringsAsFactors = FALSE)
source('merge_s1_s8s2.R')
write.csv(ret, file=paste(c("Combined/stats_",year,".csv"),collapse=""), row.names=FALSE)


# ------- costs -------
a <- read.csv(file=paste(c("mapped/wa_",year,".csv"),collapse=""))
m1 <- read.csv(file=paste(c("mapped/wm1_2552_",year,".csv"),collapse=""))
source('merge_a_m1.R')
write.csv(ret, file=paste(c("Combined/costs_",year,".csv"),collapse=""), row.names=FALSE)

# ------ visits ------
b <- read.csv(file=paste(c("mapped/wb_",year,".csv"),collapse=""))
m2 <- read.csv(file=paste(c("mapped/wm2_2552_",year,".csv"),collapse=""))
source('merge_b_m2.R')
write.csv(ret, file=paste(c("Combined/visits_",year,".csv"),collapse=""), row.names= FALSE)


# ---- payments ----       
c <- read.csv(file=paste(c("mapped/wc_",year,".csv"),collapse=""))
m3 <- read.csv(file=paste(c("mapped/wm3_2552_",year,".csv"),collapse=""))
source('merge_c_m3.R')
write.csv(ret, file=paste(c("Combined/payments",year,".csv"),collapse=""), row.names=FALSE)
