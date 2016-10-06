# Start parsing worksheet A
# Page 1
# Worksheet code : A000000


x  <- both[both$WKSHT_CD == "A000000",]

build <- data.frame(unique(x$RPT_REC_NUM))
names(build) <- "RPT_REC_NUM"

# Get Physician Costs :
#---------------------
tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 100,]
build$PHYS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 200,]
build$PHYS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 300,]
build$PHYS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 400,]
build$PHYS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 500,]
build$PHYS_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 600,]
build$PHYS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 700,]
build$PHYS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Physician Assistant Costs :
#---------------------
tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 100,]
build$PHYS_ASSI_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 200,]
build$PHYS_ASSI_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 300,]
build$PHYS_ASSI_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 400,]
build$PHYS_ASSI_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 500,]
build$PHYS_ASSI_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 600,]
build$PHYS_ASSI_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 700,]
build$PHYS_ASSI_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Nurse Practitioner Costs :
#---------------------

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 100,]
build$NURSE_PRACT_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 200,]
build$NURSE_PRACT_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 300,]
build$NURSE_PRACT_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 400,]
build$NURSE_PRACT_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 500,]
build$NURSE_PRACT_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 600,]
build$NURSE_PRACT_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 700,]
build$NURSE_PRACT_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Get Visiting Nurse Costs :
#---------------------

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 100,]
build$VISIT_NURSE_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 200,]
build$VISIT_NURSE_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 300,]
build$VISIT_NURSE_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 400,]
build$VISIT_NURSE_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 500,]
build$VISIT_NURSE_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 600,]
build$VISIT_NURSE_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 700,]
build$VISIT_NURSE_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Other Nurse Costs :
#---------------------

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 100,]
build$OTHER_NURSE_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 200,]
build$OTHER_NURSE_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 300,]
build$OTHER_NURSE_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 400,]
build$OTHER_NURSE_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 500,]
build$OTHER_NURSE_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 600,]
build$OTHER_NURSE_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 700,]
build$OTHER_NURSE_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Clinical Psychologist Costs :
#---------------------

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 100,]
build$PSYCH_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 200,]
build$PSYCH_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 300,]
build$PSYCH_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 400,]
build$PSYCH_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 500,]
build$PSYCH_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 600,]
build$PSYCH_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 700,]
build$PSYCH_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Clinical Psychologist Costs :
#---------------------


tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 100,]
build$SOCIAL_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 200,]
build$SOCIAL_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 300,]
build$SOCIAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 400,]
build$SOCIAL_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 500,]
build$SOCIAL_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 600,]
build$SOCIAL_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 700,]
build$SOCIAL_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Laboratory Technician Costs :
#---------------------

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 100,]
build$LABTECH_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 200,]
build$LABTECH_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 300,]
build$LABTECH_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 400,]
build$LABTECH_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 500,]
build$LABTECH_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 600,]
build$LABTECH_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 700,]
build$LABTECH_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Other (Specify)  Costs : 1/3
#---------------------
tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 0,]
build$STAFF_OTHER1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 100,]
build$STAFF_OTHER1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 200,]
build$STAFF_OTHER1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 300,]
build$STAFF_OTHER1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 400,]
build$STAFF_OTHER1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 500,]
build$STAFF_OTHER1_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 600,]
build$STAFF_OTHER1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 700,]
build$STAFF_OTHER1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Other (Specify)  Costs : 2/3
#---------------------
tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 0,]
build$STAFF_OTHER2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 100,]
build$STAFF_OTHER2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 200,]
build$STAFF_OTHER2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 300,]
build$STAFF_OTHER2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 400,]
build$STAFF_OTHER2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 500,]
build$STAFF_OTHER2_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 600,]
build$STAFF_OTHER2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1000 & x$CLMN_NUM == 700,]
build$STAFF_OTHER2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Get Other (Specify)  Costs : 3/3
#---------------------
tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 0,]
build$STAFF_OTHER3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 100,]
build$STAFF_OTHER3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 200,]
build$STAFF_OTHER3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 300,]
build$STAFF_OTHER3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 400,]
build$STAFF_OTHER3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 500,]
build$STAFF_OTHER3_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 600,]
build$STAFF_OTHER3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 700,]
build$STAFF_OTHER3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Get Subtotal-Facilty Health Care Staff Costs : 
#---------------------
tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 100,]
build$TOTAL_HEALTHCARE_STAFF_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 200,]
build$TOTAL_HEALTHCARE_STAFF_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 300,]
build$TOTAL_HEALTHCARE_STAFF_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 400,]
build$TOTAL_HEALTHCARE_STAFF_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 500,]
build$TOTAL_HEALTHCARE_STAFF_RECLASS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 600,]
build$TOTAL_HEALTHCARE_STAFF_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 700,]
build$TOTAL_HEALTHCARE_STAFF_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# -------------- THIS IS WHERE I STOPPED UNTIL WINTER BREAK -------------------#




# Start COSTS UNDER AGREEMENT



# Get Physician Services Under Agreement 
#----------------------------------------
tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 100,]
build$PHYS_SERV_UA_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 200,]
build$PHYS_SERV_UA_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 300,]
build$PHYS_SERV_UA_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 400,]
build$PHYS_SERV_UA_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 500,]
build$PHYS_SERV_UA_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 600,]
build$PHYS_SERV_UA_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 700,]
build$PHYS_SERV_UA_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Physician Supervision Under Agreement (1)
#------------------------------------------
tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 100,]
build$PHYS_SUPR_UA_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 200,]
build$PHYS_SUPR_UA_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 300,]
build$PHYS_SUPR_UA_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 400,]
build$PHYS_SUPR_UA_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 500,]
build$PHYS_SUPR_UA_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 600,]
build$PHYS_SUPR_UA_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 700,]
build$PHYS_SUPR_UA_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Get Other Under Agreement 
#------------------------------------------
tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 100,]
build$OTHER_UA_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 200,]
build$OTHER_UA_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 300,]
build$OTHER_UA_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 400,]
build$OTHER_UA_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 500,]
build$OTHER_UA_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 600,]
build$OTHER_UA_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 700,]
build$OTHER_UA_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Get Subtotal Under Agreement
#------------------------------------------
tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 100,]
build$SUBTOTAL_UA_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 200,]
build$SUBTOTAL_UA_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 300,]
build$SUBTOTAL_UA_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 400,]
build$SUBTOTAL_UA_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 500,]
build$SUBTOTAL_UA_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 600,]
build$SUBTOTAL_UA_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 700,]
build$SUBTOTAL_UA_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



#--------- OTHER HEALTH CARE COSTS ------------#



# Get Medical Supplies
#------------------------------------------
tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 100,]
build$MED_SUPPLIES_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 200,]
build$MED_SUPPLIES_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 300,]
build$MED_SUPPLIES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 400,]
build$MED_SUPPLIES_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 500,]
build$MED_SUPPLIES_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 600,]
build$MED_SUPPLIES_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 700,]
build$MED_SUPPLIES_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Transportation
#------------------------------------------
tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 100,]
build$TRANS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 200,]
build$TRANS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 300,]
build$TRANS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 400,]
build$TRANS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 500,]
build$TRANS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 600,]
build$TRANS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 700,]
build$TRANS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Depreciation
#------------------------------------------
tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 100,]
build$DEPREC_MEDEQUIP_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 200,]
build$DEPREC_MEDEQUIP_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 300,]
build$DEPREC_MEDEQUIP_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 400,]
build$DEPREC_MEDEQUIP_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 500,]
build$DEPREC_MEDEQUIP_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 600,]
build$DEPREC_MEDEQUIP_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 700,]
build$DEPREC_MEDEQUIP_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# Get Private Liability Insurance
#------------------------------------------
tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 100,]
build$PLINSUR_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 200,]
build$PLINSUR_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 300,]
build$PLINSUR_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 400,]
build$PLINSUR_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 500,]
build$PLINSUR_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 600,]
build$PLINSUR_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 700,]
build$PLINSUR_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Allowable GME Pass through costs
#--------------------------------------
tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 100,]
build$AGMEPTC_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 200,]
build$AGMEPTC_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 300,]
build$AGMEPTC_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 400,]
build$AGMEPTC_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 500,]
build$AGMEPTC_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 600,]
build$AGMEPTC_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 700,]
build$AGMEPTC_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Other Health Care Costs(Specify) 1/3
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 0,]
build$OTHERCOSTS_OTHER1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 100,]
build$OTHERCOSTS_OTHER1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 200,]
build$OTHERCOSTS_OTHER1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 300,]
build$OTHERCOSTS_OTHER1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 400,]
build$OTHERCOSTS_OTHER1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 500,]
build$OTHERCOSTS_OTHER1_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 600,]
build$OTHERCOSTS_OTHER1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 700,]
build$OTHERCOSTS_OTHER1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Other Health Care Costs(Specify) 2/3
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 0,]
build$OTHERCOSTS_OTHER2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 100,]
build$OTHERCOSTS_OTHER2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 200,]
build$OTHERCOSTS_OTHER2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 300,]
build$OTHERCOSTS_OTHER2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 400,]
build$OTHERCOSTS_OTHER2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 500,]
build$OTHERCOSTS_OTHER2_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 600,]
build$OTHERCOSTS_OTHER2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 700,]
build$OTHERCOSTS_OTHER2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Other Health Care Costs(Specify) 3/3
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 0,]
build$OTHERCOSTS_OTHER3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 100,]
build$OTHERCOSTS_OTHER3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 200,]
build$OTHERCOSTS_OTHER3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 300,]
build$OTHERCOSTS_OTHER3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 400,]
build$OTHERCOSTS_OTHER3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 500,]
build$OTHERCOSTS_OTHER3_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 600,]
build$OTHERCOSTS_OTHER3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 700,]
build$OTHERCOSTS_OTHER3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Subtotal Other Costs
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 100,]
build$TOTAL_OTHERCOSTS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 200,]
build$TOTAL_OTHERCOSTS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 300,]
build$TOTAL_OTHERCOSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 400,]
build$TOTAL_OTHERCOSTS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 500,]
build$TOTAL_OTHERCOSTS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 600,]
build$TOTAL_OTHERCOSTS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 700,]
build$TOTAL_OTHERCOSTS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Total Cost of Services 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 100,]
build$TOTAL_COST_SERVICES_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 200,]
build$TOTAL_COST_SERVICES_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 300,]
build$TOTAL_COST_SERVICES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 400,]
build$TOTAL_COST_SERVICES_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 500,]
build$TOTAL_COST_SERVICES_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 600,]
build$TOTAL_COST_SERVICES_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 700,]
build$TOTAL_COST_SERVICES_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# ------START FACILITIY OVERHEAD - FACILITY COST -----------#



# get Rent
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 100,]
build$RENT_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 200,]
build$RENT_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 300,]
build$RENT_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 400,]
build$RENT_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 500,]
build$RENT_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 600,]
build$RENT_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2600 & x$CLMN_NUM == 700,]
build$RENT_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Facility Insurance
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 100,]
build$FACINSURANCE_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 200,]
build$FACINSURANCE_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 300,]
build$FACINSURANCE_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 400,]
build$FACINSURANCE_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 500,]
build$FACINSURANCE_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 600,]
build$FACINSURANCE_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2700 & x$CLMN_NUM == 700,]
build$FACINSURANCE_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Interest
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 100,]
build$INTEREST_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 200,]
build$INTEREST_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 300,]
build$INTEREST_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 400,]
build$INTEREST_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 500,]
build$INTEREST_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 600,]
build$INTEREST_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2800 & x$CLMN_NUM == 700,]
build$INTEREST_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Utilities 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 100,]
build$UTILITIES_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 200,]
build$UTILITIES_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 300,]
build$UTILITIES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 400,]
build$UTILITIES_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 500,]
build$UTILITIES_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 600,]
build$UTILITIES_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 2900 & x$CLMN_NUM == 700,]
build$UTILITIES_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# --------------- Start Worksheet A Page 2 ----------------------



# get Depreciation - Buildings & Fixtures
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 100,]
build$DEPREC_BUILDFIX_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 200,]
build$DEPREC_BUILDFIX_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 300,]
build$DEPREC_BUILDFIX_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 400,]
build$DEPREC_BUILDFIX_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 500,]
build$DEPREC_BUILDFIX_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 600,]
build$DEPREC_BUILDFIX_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3000 & x$CLMN_NUM == 700,]
build$DEPREC_BUILDFIX_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Depreciation - Equipment
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 100,]
build$DEPREC_EQUIP_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 200,]
build$DEPREC_EQUIP_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 300,]
build$DEPREC_EQUIP_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 400,]
build$DEPREC_EQUIP_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 500,]
build$DEPREC_EQUIP_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 600,]
build$DEPREC_EQUIP_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3100 & x$CLMN_NUM == 700,]
build$DEPREC_EQUIP_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Housekeeping and Maintenance 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 100,]
build$HOUSEKEEP_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 200,]
build$HOUSEKEEP_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 300,]
build$HOUSEKEEP_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 400,]
build$HOUSEKEEP_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 500,]
build$HOUSEKEEP_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 600,]
build$HOUSEKEEP_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3200 & x$CLMN_NUM == 700,]
build$HOUSEKEEP_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Property Tax
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 100,]
build$PROPTAX_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 200,]
build$PROPTAX_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 300,]
build$PROPTAX_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 400,]
build$PROPTAX_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 500,]
build$PROPTAX_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 600,]
build$PROPTAX_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3300 & x$CLMN_NUM == 700,]
build$PROPTAX_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# facility cost other1 (1 / 3) 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 0,]
build$FACILITYCOST_OTHER1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 100,]
build$FACILITYCOST_OTHER1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 200,]
build$FACILITYCOST_OTHER1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 300,]
build$FACILITYCOST_OTHER1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 400,]
build$FACILITYCOST_OTHER1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 500,]
build$FACILITYCOST_OTHER1_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 600,]
build$FACILITYCOST_OTHER1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3400 & x$CLMN_NUM == 700,]
build$FACILITYCOST_OTHER1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# facility cost other2 (2 / 3) 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 0,]
build$FACILITYCOST_OTHER2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 100,]
build$FACILITYCOST_OTHER2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 200,]
build$FACILITYCOST_OTHER2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 300,]
build$FACILITYCOST_OTHER2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 400,]
build$FACILITYCOST_OTHER2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 500,]
build$FACILITYCOST_OTHER2_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 600,]
build$FACILITYCOST_OTHER2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3500 & x$CLMN_NUM == 700,]
build$FACILITYCOST_OTHER2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# facility cost other3 (3 / 3) 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 0,]
build$FACILITYCOST_OTHER3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 100,]
build$FACILITYCOST_OTHER3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 200,]
build$FACILITYCOST_OTHER3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 300,]
build$FACILITYCOST_OTHER3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 400,]
build$FACILITYCOST_OTHER3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 500,]
build$FACILITYCOST_OTHER3_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 600,]
build$FACILITYCOST_OTHER3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3600 & x$CLMN_NUM == 700,]
build$FACILITYCOST_OTHER3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Subtotal - Facility Costs 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 100,]
build$TOTAL_FACILITYCOSTS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 200,]
build$TOTAL_FACILITYCOSTS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 300,]
build$TOTAL_FACILITYCOSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 400,]
build$TOTAL_FACILITYCOSTS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 500,]
build$TOTAL_FACILITYCOSTS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 600,]
build$TOTAL_FACILITYCOSTS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3700 & x$CLMN_NUM == 700,]
build$TOTAL_FACILITYCOSTS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# --------------- Start Facility Overhead - Administrative Costs ------------------




# get Office Salaries 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 100,]
build$OFFICESALARIES_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 200,]
build$OFFICESALARIES_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 300,]
build$OFFICESALARIES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 400,]
build$OFFICESALARIES_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 500,]
build$OFFICESALARIES_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 600,]
build$OFFICESALARIES_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3800 & x$CLMN_NUM == 700,]
build$OFFICESALARIES_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Depreciation - Office Equipment 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 100,]
build$DEPREC_OFFEQUIP_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 200,]
build$DEPREC_OFFEQUIP_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 300,]
build$DEPREC_OFFEQUIP_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 400,]
build$DEPREC_OFFEQUIP_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 500,]
build$DEPREC_OFFEQUIP_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 600,]
build$DEPREC_OFFEQUIP_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 3900 & x$CLMN_NUM == 700,]
build$DEPREC_OFFEQUIP_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Office Supplies
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 100,]
build$OFFICESUPPLIES_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 200,]
build$OFFICESUPPLIES_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 300,]
build$OFFICESUPPLIES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 400,]
build$OFFICESUPPLIES_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 500,]
build$OFFICESUPPLIES_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 600,]
build$OFFICESUPPLIES_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4000 & x$CLMN_NUM == 700,]
build$OFFICESUPPLIES_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Legal 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 100,]
build$LEGAL_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 200,]
build$LEGAL_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 300,]
build$LEGAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 400,]
build$LEGAL_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 500,]
build$LEGAL_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 600,]
build$LEGAL_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4100 & x$CLMN_NUM == 700,]
build$LEGAL_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])





# get Accounting 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 100,]
build$ACCOUNTING_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 200,]
build$ACCOUNTING_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 300,]
build$ACCOUNTING_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 400,]
build$ACCOUNTING_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 500,]
build$ACCOUNTING_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 600,]
build$ACCOUNTING_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4200 & x$CLMN_NUM == 700,]
build$ACCOUNTING_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Insurance 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 100,]
build$INSURANCE_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 200,]
build$INSURANCE_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 300,]
build$INSURANCE_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 400,]
build$INSURANCE_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 500,]
build$INSURANCE_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 600,]
build$INSURANCE_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4300 & x$CLMN_NUM == 700,]
build$INSURANCE_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Telephone
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 100,]
build$TELEPHONE_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 200,]
build$TELEPHONE_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 300,]
build$TELEPHONE_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 400,]
build$TELEPHONE_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 500,]
build$TELEPHONE_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 600,]
build$TELEPHONE_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4400 & x$CLMN_NUM == 700,]
build$TELEPHONE_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Fringe Benefits and Payroll Taxes 
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 100,]
build$FBAPT_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 200,]
build$FBAPT_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 300,]
build$FBAPT_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 400,]
build$FBAPT_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 500,]
build$FBAPT_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 600,]
build$FBAPT_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4500 & x$CLMN_NUM == 700,]
build$FBAPT_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# TODO :  Other (1-3 )


# get Administrative costs Other1 (1/3)
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 0,]
build$ADMINCOST_OTHER1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 100,]
build$ADMINCOST_OTHER1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 200,]
build$ADMINCOST_OTHER1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 300,]
build$ADMINCOST_OTHER1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 400,]
build$ADMINCOST_OTHER1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 500,]
build$ADMINCOST_OTHER1_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 600,]
build$ADMINCOST_OTHER1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4600 & x$CLMN_NUM == 700,]
build$ADMINCOST_OTHER1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Administrative costs Other2 (2/3)
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 0,]
build$ADMINCOST_OTHER2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 100,]
build$ADMINCOST_OTHER2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 200,]
build$ADMINCOST_OTHER2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 300,]
build$ADMINCOST_OTHER2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 400,]
build$ADMINCOST_OTHER2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 500,]
build$ADMINCOST_OTHER2_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 600,]
build$ADMINCOST_OTHER2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4700 & x$CLMN_NUM == 700,]
build$ADMINCOST_OTHER2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Administrative costs Other3 (3/3)
#------------------------------------------------
tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 0,]
build$ADMINCOST_OTHER3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 100,]
build$ADMINCOST_OTHER3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 200,]
build$ADMINCOST_OTHER3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 300,]
build$ADMINCOST_OTHER3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 400,]
build$ADMINCOST_OTHER3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 500,]
build$ADMINCOST_OTHER3_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 600,]
build$ADMINCOST_OTHER3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4800 & x$CLMN_NUM == 700,]
build$ADMINCOST_OTHER3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Subtotal - Administrative Costs
#------------------------------------------------

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 100,]
build$TOTAL_ADMINCOSTS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 200,]
build$TOTAL_ADMINCOSTS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 300,]
build$TOTAL_ADMINCOSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 400,]
build$TOTAL_ADMINCOSTS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 500,]
build$TOTAL_ADMINCOSTS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 600,]
build$TOTAL_ADMINCOSTS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 4900 & x$CLMN_NUM == 700,]
build$TOTAL_ADMINCOSTS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Total Overhead
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 100,]
build$TOTAL_OVERHEAD_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 200,]
build$TOTAL_OVERHEAD_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 300,]
build$TOTAL_OVERHEAD_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 400,]
build$TOTAL_OVERHEAD_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 500,]
build$TOTAL_OVERHEAD_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 600,]
build$TOTAL_OVERHEAD_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5000 & x$CLMN_NUM == 700,]
build$TOTAL_OVERHEAD_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# ---- Start Cost other than RHC/FQHC Services----------



# get Pharmacy
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 100,]
build$PHARMACY_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 200,]
build$PHARMACY_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 300,]
build$PHARMACY_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 400,]
build$PHARMACY_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 500,]
build$PHARMACY_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 600,]
build$PHARMACY_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5100 & x$CLMN_NUM == 700,]
build$PHARMACY_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Dental
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 100,]
build$DENTAL_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 200,]
build$DENTAL_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 300,]
build$DENTAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 400,]
build$DENTAL_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 500,]
build$DENTAL_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 600,]
build$DENTAL_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5200 & x$CLMN_NUM == 700,]
build$DENTAL_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Optometry 
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 100,]
build$OPTOMETRY_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 200,]
build$OPTOMETRY_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 300,]
build$OPTOMETRY_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 400,]
build$OPTOMETRY_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 500,]
build$OPTOMETRY_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 600,]
build$OPTOMETRY_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5300 & x$CLMN_NUM == 700,]
build$OPTOMETRY_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])





# get Non-allowables GME Pass Through COSTS
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 100,]
build$NAGMEPTC_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 200,]
build$NAGMEPTC_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 300,]
build$NAGMEPTC_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 400,]
build$NAGMEPTC_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 500,]
build$NAGMEPTC_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 600,]
build$NAGMEPTC_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5350 & x$CLMN_NUM == 700,]
build$NAGMEPTC_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Cost Other than RHC/FQHC Services - Other 1 
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 0,]
build$NONRHC_OTHER1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 100,]
build$NONRHC_OTHER1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 200,]
build$NONRHC_OTHER1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 300,]
build$NONRHC_OTHER1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 400,]
build$NONRHC_OTHER1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 500,]
build$NONRHC_OTHER1_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 600,]
build$NONRHC_OTHER1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5400 & x$CLMN_NUM == 700,]
build$NONRHC_OTHER1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Cost Other than RHC/FQHC Services - Other 2
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 0,]
build$NONRHC_OTHER2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 100,]
build$NONRHC_OTHER2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 200,]
build$NONRHC_OTHER2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 300,]
build$NONRHC_OTHER2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 400,]
build$NONRHC_OTHER2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 500,]
build$NONRHC_OTHER2_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 600,]
build$NONRHC_OTHER2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5500 & x$CLMN_NUM == 700,]
build$NONRHC_OTHER2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Cost Other than RHC/FQHC Services - Other 3
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 0,]
build$NONRHC_OTHER3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 100,]
build$NONRHC_OTHER3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 200,]
build$NONRHC_OTHER3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 300,]
build$NONRHC_OTHER3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 400,]
build$NONRHC_OTHER3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 500,]
build$NONRHC_OTHER3_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 600,]
build$NONRHC_OTHER3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5600 & x$CLMN_NUM == 700,]
build$NONRHC_OTHER3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Subtotal - Cost other than RHC / FQHC
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 100,]
build$TOTAL_NONRHC_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 200,]
build$TOTAL_NONRHC_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 300,]
build$TOTAL_NONRHC_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 400,]
build$TOTAL_NONRHC_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 500,]
build$TOTAL_NONRHC_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 600,]
build$TOTAL_NONRHC_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5700 & x$CLMN_NUM == 700,]
build$TOTAL_NONRHC_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Non-Reimbursable Costs - 1 
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 0,]
build$NONREIMBURS_1_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 100,]
build$NONREIMBURS_1_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 200,]
build$NONREIMBURS_1_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 300,]
build$NONREIMBURS_1_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 400,]
build$NONREIMBURS_1_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 500,]
build$NONREIMBURS_1_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 600,]
build$NONREIMBURS_1_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5800 & x$CLMN_NUM == 700,]
build$NONREIMBURS_1_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Non-Reimbursable Costs - 2 
#------------------------------------------------

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 0,]
build$NONREIMBURS_2_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 100,]
build$NONREIMBURS_2_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 200,]
build$NONREIMBURS_2_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 300,]
build$NONREIMBURS_2_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 400,]
build$NONREIMBURS_2_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 500,]
build$NONREIMBURS_2_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 600,]
build$NONREIMBURS_2_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 5900 & x$CLMN_NUM == 700,]
build$NONREIMBURS_2_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Non-Reimbursable Costs - 3
#------------------------------------------------

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 0,]
build$NONREIMBURS_3_SPECIFY <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 100,]
build$NONREIMBURS_3_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 200,]
build$NONREIMBURS_3_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 300,]
build$NONREIMBURS_3_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 400,]
build$NONREIMBURS_3_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 500,]
build$NONREIMBURS_3_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 600,]
build$NONREIMBURS_3_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6000 & x$CLMN_NUM == 700,]
build$NONREIMBURS_3_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Subtotal Non-reimburseible costs 
#---------------------------------------

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 100,]
build$TOTAL_NONREIMBURS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 200,]
build$TOTAL_NONREIMBURS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 300,]
build$TOTAL_NONREIMBURS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 400,]
build$TOTAL_NONREIMBURS_RECLASS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 500,]
build$TOTAL_NONREIMBURS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 600,]
build$TOTAL_NONREIMBURS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6100 & x$CLMN_NUM == 700,]
build$TOTAL_NONREIMBURS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])








#  get Total Costs 
#---------------------------------------

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 100,]
build$TOTAL_COSTS_COMP <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 200,]
build$TOTAL_COSTS_OTHER <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 300,]
build$TOTAL_COSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 500,]
build$TOTAL_COSTS_BAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 600,]
build$TOTAL_COSTS_ADJUST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 6200 & x$CLMN_NUM == 700,]
build$TOTAL_COSTS_NET <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



#--------------# FINISH A-2 




# write.csv(build, "wa_mapped.csv", row.names=FALSE)

















