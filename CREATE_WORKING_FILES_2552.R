# create working files for 2552-10



# ----------------- 2011 --------------------

hclinic_ALPHA <- read.csv("HOSP10FY2011/hosp10_2011_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HOSP10FY2011/hosp10_2011_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HOSP10FY2011/hosp10_2011_RPT.CSV", header=FALSE)


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
write.csv(res, "temp/s8_2011.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res, "temp/m_2011.csv", row.names = FALSE)


res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, "temp/s2_2011.csv", row.names = FALSE)





# -------------------- 2012 ---------------------

hclinic_ALPHA <- read.csv("HOSP10FY2012/hosp10_2012_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HOSP10FY2012/hosp10_2012_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HOSP10FY2012/hosp10_2012_RPT.CSV", header=FALSE)


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


# Start trying to build working table

res <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
write.csv(res, "temp/s8_2012.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res, "temp/m_2012.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, "temp/s2_2012.csv", row.names = FALSE)


# ----------------- 2013 --------------------

hclinic_ALPHA <- read.csv("HOSP10FY2013/hosp10_2013_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HOSP10FY2013/hosp10_2013_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HOSP10FY2013/hosp10_2013_RPT.CSV", header=FALSE)


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


# Start trying to build working table

res <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
write.csv(res, "temp/s8_2013.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res, "temp/m_2013.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, "temp/s2_2013.csv", row.names = FALSE)


# ----------------- 2014 --------------------

hclinic_ALPHA <- read.csv("HOSP10FY2014/hosp10_2014_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HOSP10FY2014/hosp10_2014_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HOSP10FY2014/hosp10_2014_RPT.CSV", header=FALSE)


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


# Start trying to build working table

res <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
write.csv(res, "temp/s8_2014.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res, "temp/m_2014.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, "temp/s2_2014.csv", row.names = FALSE)



# --- START NEW -------


# ----------------- 2015 --------------------

hclinic_ALPHA <- read.csv("HOSP10FY2015/hosp10_2015_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HOSP10FY2015/hosp10_2015_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HOSP10FY2015/hosp10_2015_RPT.CSV", header=FALSE)


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


# Start trying to build working table

res <- subset(both,  grepl(glob2rx("S8*R*") , WKSHT_CD) )
write.csv(res, "temp/s8_2015.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("M*R*") , WKSHT_CD) )
write.csv(res, "temp/m_2015.csv", row.names = FALSE)

res <- subset(both,  grepl(glob2rx("S2*1") , WKSHT_CD) )
write.csv(res, "temp/s2_2015.csv", row.names = FALSE)














