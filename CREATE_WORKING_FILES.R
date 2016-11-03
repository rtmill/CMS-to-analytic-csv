# Script to create working files, named "both" to represent both alpha and nmrc
# --- current configuration creates work files for years 2011-2014

# ------------------------------ 2011 --------------------------------------------------

# Import the three files
hclinic_ALPHA <- read.csv("HCLINIC-ALL-YEARS/hclinic_2011_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HCLINIC-ALL-YEARS/hclinic_2011_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HCLINIC-ALL-YEARS/hclinic_2011_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

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

write.csv(both, "temp/both2011.csv", row.names = FALSE)


# ------------------------------ 2012 --------------------------------------------------

# Import the three files
hclinic_ALPHA <- read.csv("HCLINIC-ALL-YEARS/hclinic_2012_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HCLINIC-ALL-YEARS/hclinic_2012_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HCLINIC-ALL-YEARS/hclinic_2012_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

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

write.csv(both, "temp/both2012.csv", row.names = FALSE)



# ------------------------------ 2013 --------------------------------------------------

# Import the three files
hclinic_ALPHA <- read.csv("HCLINIC-ALL-YEARS/hclinic_2013_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HCLINIC-ALL-YEARS/hclinic_2013_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HCLINIC-ALL-YEARS/hclinic_2013_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

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

write.csv(both, "temp/both2013.csv", row.names = FALSE)



# ------------------------------ 2014 --------------------------------------------------

# Import the three files
hclinic_ALPHA <- read.csv("HCLINIC-ALL-YEARS/hclinic_2014_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HCLINIC-ALL-YEARS/hclinic_2014_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HCLINIC-ALL-YEARS/hclinic_2014_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

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

write.csv(both, "temp/both2014.csv", row.names = FALSE)



# ------------------------------ 2015 --------------------------------------------------

# Import the three files
hclinic_ALPHA <- read.csv("HCLINIC-ALL-YEARS/hclinic_2015_ALPHA.CSV", header=FALSE)
hclinic_NMRC <- read.csv("HCLINIC-ALL-YEARS/hclinic_2015_NMRC.CSV", header=FALSE)
hclinic_RPT <- read.csv("HCLINIC-ALL-YEARS/hclinic_2015_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

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

write.csv(both, "temp/both2015.csv", row.names = FALSE)

