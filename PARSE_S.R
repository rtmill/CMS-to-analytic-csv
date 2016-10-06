# Parse Worksheets S1 and S2
#--------------------------



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
build$OPERATE_AS_RHC_MON_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1102 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_MON_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1103 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_TUE_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1103 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_TUE_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1104 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1104 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1105 & both$CLMN_NUM == 100,]
build$OPERATE_AS_RHC_THU_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1105 & both$CLMN_NUM == 200,]
build$OPERATE_AS_RHC_THU_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

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
build$OPERATE_AS_OTHER_MON_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : MONDAY, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1202 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_MON_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : TUES, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1203 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_TUE_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : TUES, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1203 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_TUE_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : WED, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1204 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_WED_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : WED, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1204 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_WED_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

# Get : THUR, FROM hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1205 & both$CLMN_NUM == 100,]
build$OPERATE_AS_OTHER_THU_FROM  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])
# Get : THUR, TO hours
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1205 & both$CLMN_NUM == 200,]
build$OPERATE_AS_OTHER_THU_TO  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])

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


# Get 'If this is a low or no Medicare Utilization cost report, enter "L" for low or "N" for no Medicare utilization'? 
#--------------------------------------------------------
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1300 & both$CLMN_NUM == 100,]
build$LOWORNO_MEDICARE_UTIL  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])


# Get 'is this facility filing a consolidated cost report'? 
#--------------------------------------------------------
tmp <- both[both$WKSHT_CD == "S000001" & both$LINE_NUM == 1400 & both$CLMN_NUM == 100,]
build$CONSOLIDATED  <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM, tmp$RPT_REC_NUM)])





# ------ 

# write.csv(build, "ws1_mapped.csv", row.names = FALSE)


#-------------------------------END WORKSHEET S PART 1 ------------------------











