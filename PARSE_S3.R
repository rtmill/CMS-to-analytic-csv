# Script to parse Worksheet S part III 

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

# tmp <- both[both$WKSHT_CD == "S000013" & both$LINE_NUM == 801 & both$CLMN_NUM == 200,]


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


# write.csv(build, "ws3_mapped.csv", row.names = FALSE)


