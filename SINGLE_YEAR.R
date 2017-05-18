




# ----- 222-92 ----- #

# --- CREATE WORKING FILES --- # 


if( !file.exists(file=paste(c(source_dir, "/hclinic_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("independent alpha not found")
}
if( !file.exists(file=paste(c(source_dir, "/hclinic_", year, "_NMRC.CSV"),collapse="")) ){
  cat("independent nmrc not found")
}

alpha <- read.csv(file=paste(c(source_dir, "/hclinic_", year, "_ALPHA.CSV"),collapse="") , header=FALSE)
nmrc <- read.csv(file=paste(c(source_dir, "/hclinic_", year, "_NMRC.CSV"),collapse="") , header=FALSE)

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




# Run script to map worksheet c parts I & II
source('PARSE_C.R')
if(write_before_merge){
  write.csv(build, file=paste(c(mapped_dir,"/wc_",year,".csv"),collapse=""),row.names=FALSE )
}
c <- build

# Run script to map worksheet b
source('PARSE_B.R')
if(write_before_merge){
  write.csv(build, file=paste(c(mapped_dir,"/wb_",year,".csv"),collapse=""),row.names=FALSE )
}
b <- build

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
if(write_before_merge){
  write.csv(build, file=paste(c(mapped_dir,"/wa_",year,".csv"),collapse=""),row.names=FALSE )
}
a <- build

# Run script to map worksheet s, parts I & II
source('PARSE_S.R')
if(write_before_merge){
  write.csv(build, file=paste(c(mapped_dir,"/ws_",year,".csv"),collapse=""),row.names=FALSE )
}
s1 <- build

# Run script to map worksheet s, part III
source('PARSE_S32.R')
if(write_before_merge){
  write.csv(temp, file=paste(c(mapped_dir,"/ws3_",year,".csv"),collapse=""),row.names=FALSE )
}
s3 <- temp


rm(both, build, tmp, temp, x, y, z, i)



# -- end 222-92 --- 






# -----------  2552-10  ---------- #

# --- CREATE WORKING FILES --- # 



issues = FALSE
if( !file.exists(file=paste(c(source_dir,"/hosp10_", year, "_ALPHA.CSV"),collapse="")) ){
  cat("provider alpha not found")
  issues = TRUE
}
if( !file.exists(file=paste(c(source_dir,"/hosp10_", year, "_NMRC.CSV"),collapse="")) ){
  cat("provider nmrc not found")
  issues = TRUE
}

if(issues){
  return()
}


alpha <- read.csv(file=paste(c(source_dir,"/hosp10_", year, "_ALPHA.CSV"),collapse=""), header=FALSE)
nmrc <- read.csv(file=paste(c(source_dir,"/hosp10_", year, "_NMRC.CSV"),collapse=""), header=FALSE)
#Numeric table
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","VAL")
nmrc$VAL <- as.factor(nmrc$VAL)
nmrc$CLMN_NUM <- as.character(nmrc$CLMN_NUM)
nmrc$CLMN_NUM <- as.integer(nmrc$CLMN_NUM)

# Alpha table
names(alpha) <- names(nmrc)

both <- rbind.data.frame(alpha, nmrc)
both$LINE_NUM <- as.integer(both$LINE_NUM)
both$CLMN_NUM <- as.integer(both$CLMN_NUM)



rm(nmrc, alpha)




s8 <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )



m <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )


s2 <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )



rm(both)


#s8 <- read.csv(file=paste(c("src/s8_", year, ".csv"),collapse=""))
source('PARSE_2552_S8.R')
#s2 <- read.csv(file=paste(c("src/s2_", year, ".csv"),collapse=""))
source('PARSE_2552_S2.R')
s8 <- temp
rm(s2)
if(write_before_merge){
  write.csv(temp, file=paste(c(mapped_dir,"/ws8_2552_",year,".csv"),collapse=""), row.names = FALSE)
}


# m <- read.csv(file=paste(c("src/m_", year, ".csv"),collapse=""))
source('PARSE_2552_M1.R')
m1 <- temp
if(write_before_merge){
  write.csv(temp, file=paste(c(mapped_dir,"/wm1_2552_",year,".csv"),collapse=""), row.names = FALSE)
}
source('PARSE_2552_M2.R')
m2 <- temp
if(write_before_merge){
  write.csv(temp, file=paste(c(mapped_dir,"/wm2_2552_",year,".csv"),collapse=""), row.names = FALSE)
}
source('PARSE_2552_M3.R')
m3 <- temp
if(write_before_merge){
  write.csv(temp, file=paste(c(mapped_dir,"/wm3_2552_",year,".csv"),collapse=""), row.names = FALSE)
}


rm(temp)


# ---------- MERGE -------------#


# ----  stats  -----
source('merge_s1_s8s2.R')
if(write_before_merge){
  write.csv(ret, file=paste(c(dest_dir,"/stats_",year,".csv"),collapse=""), row.names=FALSE)
}

# ------- costs -------
source('merge_a_m1.R')
if(write_before_merge){
  write.csv(ret, file=paste(c(dest_dir,"/costs_",year,".csv"),collapse=""), row.names=FALSE)
}

# ------ visits ------
source('merge_b_m2.R')
if(write_before_merge){
  write.csv(ret, file=paste(c(dest_dir,"/visits_",year,".csv"),collapse=""), row.names= FALSE)
}

# ---- payments ----       
source('merge_c_m3.R')
if(write_before_merge){
  write.csv(ret, file=paste(c(dest_dir,"/payments_",year,".csv"),collapse=""), row.names=FALSE)
}
