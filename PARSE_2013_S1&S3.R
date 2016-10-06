# Parse Worksheets S1 and S3
#--------------------------


# Import the three files 
hclinic_2013_ALPHA <- read.csv("W:/Downloads/HCLINIC-ALL-YEARS/hclinic_2013_ALPHA.CSV", header=FALSE)
hclinic_2013_NMRC <- read.csv("W:/Downloads/HCLINIC-ALL-YEARS/hclinic_2013_NMRC.CSV", header=FALSE)
hclinic_2013_RPT <- read.csv("W:/Downloads/HCLINIC-ALL-YEARS/hclinic_2013_RPT.CSV", header=FALSE)

# Rename the files ( so I can read the damn things )

#Report table 
rpt <- hclinic_2013_RPT
names(rpt) <- c("RPT_REC_NUM", "PRVDR_CTRL_TYPE_CD", "PRVDR_NUM", "NPI", "RPT_STUS_CD",
                "FY_BGN_DT","FY_END_DT", "PROC_DT", "INITL_RPT_SW", "LAST_RPT_SW", "TRANSMTL_NUM",
                "FI_NUM", "ADR_VNDR_CD", "FI_CREATE_DT", "UTIL_CD", "NPR_DT", "SPEC_IND","FI_RCPT_DT"
                )

#Numeric table
nmrc <- hclinic_2013_NMRC
names(nmrc)<-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_VAL_NUM")


# Alpha table
alpha <- hclinic_2013_ALPHA
names(alpha) <-c("RPT_REC_NUM","WKSHT_CD","LINE_NUM","CLMN_NUM","ITM_ALPHNMRC_ITM_TXT")

#end renaming

# ----------- #

# write.csv(alpha, "alpha.csv", row.names = FALSE)
# write.csv(nmrc, "nmrc.csv", row.names = FALSE)
# write.csv(rpt, "rpt.csv", row.names = FALSE)

# ------------------- # 

# Combine the two tables for easier searching:

nmrc$ITM_VAL_NUM <- as.factor(nmrc$ITM_VAL_NUM)
x <- names(alpha)
x[5] <- "VAL"
names(alpha) <- x
names(nmrc) <- x

both <- rbind.data.frame(alpha, nmrc)

#write.csv(both, "both.csv", row.names = FALSE)
# ----------------------------#



# ------ Start Parsing ! ----- # 


# Starting to grow a provider level table, calling it : build

# WORKSHEET s1

# Get Name
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 100 & both$CLMN_NUM == 100,]
build <- data.frame(tmp$RPT_REC_NUM, tmp$VAL)
names(build) <- c("RPT_REC_NUM", "NAME")

# Get city
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 102 & both$CLMN_NUM == 100,]
build$CITY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get State
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 102 & both$CLMN_NUM == 200,]
build$STATE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get Zip 
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 102 & both$CLMN_NUM == 300,]
build$ZIP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get County
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 103 & both$CLMN_NUM == 100,]
build$COUNTY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get CCN
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 200 & both$CLMN_NUM == 100,]
build$CCN <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])



# ----
# TODO  : Verify below & (for next two) possibly convert values to meanings
#----- 

# --- NEED TO VERIFY THIS ---- #
# Column two does not exist in either, column 1 (which looks like it should be nothing) has values
# Get Type of control
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 500 & both$CLMN_NUM == 100,]
build$TYPE_OF_CONTROL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get type of provider 
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 500 & both$CLMN_NUM == 300,]
build$TYPE_OF_PROVIDER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# ------
# TODO  : Not finding any data corresponding to the given rows for Supervisory Physicians 
#         Supposed to be 8.01 - 8.05
# ----
# SUPERVISORY PHYSICIANS SECTION 



# Get received an approval for exception to productivity standard
# ---
# TODO : ?? 
# --- Lots of NA Values from this
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 851 & both$CLMN_NUM == 100,]
build$RCVD_EXCPT_PROD_STANDARD  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# Get : does facilty operate as other than RHC or FQHC? 
# ---
# TODO : ?? 
# --- Lots of NA Values from this
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 900 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : if operate as other, the type 
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1000 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_TYPE  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# -- Days and hours(FROM/TO) operated as RHC / FQHC ----#

# Get : Sunday, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1101 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_SUN_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : Sunday, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1101 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_SUN_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : MONDAY, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1102 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_MOND_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1102 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_MOND_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1103 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_TUES_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1103 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_TUES_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1104 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1104 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1105 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_THUR_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1105 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_THUR_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : FRI, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1106 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_FRI_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : FRI, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1106 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_FRI_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : SAT, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1107 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_SAT_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : SAT, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1107 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_SAT_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# --- END RHC OPERATIONS DAYS/HOUR ----- # 


# --- START OTHER OPERATIONS DAYS / HOURS -- # 

# Get : Sunday, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1201 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_SUN_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : Sunday, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1201 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_SUN_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : MONDAY, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1202 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_MOND_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1202 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_MOND_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1203 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_TUES_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1203 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_TUES_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1204 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1204 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1205 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_THUR_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1205 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_THUR_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : FRI, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1206 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_FRI_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : FRI, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1206 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_FRI_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : SAT, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1207 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_SAT_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : SAT, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1207 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_SAT_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# ---- END DAYS / HOURS OF OPERATION -----------# 



# ------ 

# write.csv(build, "ws1_mapped.csv", row.names = FALSE)
#-------------------------------END WORKSHEET S PART 1 ------------------------



# START WORKSHEET S PART 3
  # -- "STATISTICAL DATA FOR CLINICS FILING UNDER CONSOLIDATED COST REPORTING" ---

# -- // Other than these first 6 values, the mapping is equivalent to Worksheet S-1

# Get Name
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 100 & both$CLMN_NUM == 100,]
build <- data.frame(tmp$RPT_REC_NUM, tmp$VAL)
names(build) <- c("RPT_REC_NUM", "NAME")

# Get city
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 300 & both$CLMN_NUM == 100,]
build$CITY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get State
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 300 & both$CLMN_NUM == 200,]
build$STATE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get Zip 
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 300 & both$CLMN_NUM == 300,]
build$ZIP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get COUNTY
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 400 & both$CLMN_NUM == 100,]
build$COUNTY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# -- // This is CCN in S1 --- equivalent? 
# Get Provider Number
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 500 & both$CLMN_NUM == 100,]
build$PROV_NUM <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# --- 
# TODO: There is only 1 value in all of these. In the S1 there were none.
# ---- DR. UFFORD works 208 hours this period and is the only Supervisory physician in the RHC world? 
# --------- Supervisory Physician section -----  # 

tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 801 & both$CLMN_NUM == 200,]



# --- The S3 does not have the 'Have you received an approval for an exception to the productivty standard?' row




# Get : does facilty operate as other than RHC or FQHC? 
# ---
# TODO : ?? 
# --- Lots of NA Values from this
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 900 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : if operate as other, the type 
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1000 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_TYPE  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# -- Days and hours(FROM/TO) operated as RHC / FQHC ----#

# Get : Sunday, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1101 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_SUN_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : Sunday, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1101 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_SUN_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : MONDAY, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1102 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_MOND_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1102 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_MOND_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1103 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_TUES_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1103 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_TUES_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1104 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1104 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1105 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_THUR_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1105 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_THUR_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : FRI, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1106 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_FRI_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : FRI, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1106 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_FRI_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : SAT, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1107 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_SAT_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : SAT, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1107 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_SAT_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# --- END RHC OPERATIONS DAYS/HOUR ----- # 


# --- START OTHER OPERATIONS DAYS / HOURS -- # 

# Get : Sunday, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1201 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_SUN_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : Sunday, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1201 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_SUN_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : MONDAY, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1202 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_MOND_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1202 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_MOND_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1203 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_TUES_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1203 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_TUES_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1204 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1204 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1205 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_THUR_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1205 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_THUR_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : FRI, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1206 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_FRI_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : FRI, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1206 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_FRI_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : SAT, FROM hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1207 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_SAT_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : SAT, TO hours
tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 1207 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_SAT_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])



# ------------- END WORKSHEET S3 ---------------- # 


write.csv(build, "ws3_mapped.csv", row.names = FALSE)









