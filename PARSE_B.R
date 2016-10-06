# Script to parse Worksheet B parts 1 & 2 


x  <- both[both$WKSHT_CD == "B000001",]

build <- data.frame(unique(x$RPT_REC_NUM))
names(build) <- "RPT_REC_NUM"


# Start Worksheet B Part I 


# ------ VISITS AND PRODUCTIVITY ------- #


# get Physicians 
#--------------------------------------
tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 100,]
build$PHYS_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 200,]
build$PHYS_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 300,]
build$PHYS_PRODSTANDARD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 400,]
build$PHYS_MINVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Physicians Assistants 
#--------------------------------------
tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 100,]
build$PHYS_ASSI_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 200,]
build$PHYS_ASSI_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 300,]
build$PHYS_ASSI_PRODSTANDARD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 400,]
build$PHYS_ASSI_MINVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Nurse Practitioners
#--------------------------------------
tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 100,]
build$NURSE_PRACT_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 200,]
build$NURSE_PRACT_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 300,]
build$NURSE_PRACT_PRODSTANDARD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 400,]
build$NURSE_PRACT_MINVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Subtotal 
#--------------------------------------
tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 100,]
build$SUBTOTAL_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 200,]
build$SUBTOTAL_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 400,]
build$SUBTOTAL_MINVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 500,]
build$SUBTOTAL_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Visiting Nurse 
#--------------------------------------
tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 100,]
build$VISIT_NURSE_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 200,]
build$VISIT_NURSE_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 500,]
build$VISIT_NURSE_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Clinical Psychologist 
#--------------------------------------
tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 100,]
build$PSYCH_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 200,]
build$PSYCH_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 500,]
build$PSYCH_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Clinical Social Worker
#--------------------------------------
tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 100,]
build$SOCIAL_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 200,]
build$SOCIAL_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 500,]
build$SOCIAL_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# -- start FQHC ONLY -- #

# get Medical Nutrition Therapist 
#--------------------------------------
tmp <- x[x$LINE_NUM == 701 & x$CLMN_NUM == 100,]
build$NUTRTHERA_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 701 & x$CLMN_NUM == 200,]
build$NUTRTHERA_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 701 & x$CLMN_NUM == 500,]
build$NUTRTHERA_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Diabetes Self Management Training 
#--------------------------------------
tmp <- x[x$LINE_NUM == 702 & x$CLMN_NUM == 100,]
build$DSMT_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 702 & x$CLMN_NUM == 200,]
build$DSMT_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 702 & x$CLMN_NUM == 500,]
build$DSMT_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


#--  /end FQHC only section --- 






# get Total Staff 
#--------------------------------------
tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 100,]
build$TOTALSTAFF_NUMFTE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 200,]
build$TOTALSTAFF_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 500,]
build$TOTALSTAFF_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Physician Services Under Agreement 
#--------------------------------------
tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 200,]
build$PSUA_TOTALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 500,]
build$PSUA_GREATEROF <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# ------------- End Worksheet B Part 1 ------------------------------- # 




# Start Worksheet B Part II ---------------------------
# Determination of Total Allowable Cost Applicable to RHC Services 


# get Cost of RHC/FQHC Services - Excluding Overhead
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1000,]
build$RHCSERVICES_EXCLUDINGOVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Cost of NON RHC/FQHC Services - Excluding Overhead
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1100,]
build$NONRHCSERVICES_EXCLUDINGOVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Cost of All Services - Excluding Overhead
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1200,]
build$ALLSERVICES_EXCLUDINGOVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Ratio of RHC / FQHC Services
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1300,]
build$RATIO_RHCSERVICES <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Overhead
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1400,]
build$TOTAL_OVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Allowable GME Overhead
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1401,]
build$ALLOWABLE_GME_OVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Net Facility Overhead Costs 
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1402,]
build$NET_FACILITY_OVERHEAD <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Overhead applicable to RHC/FQHC services
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1500,]
build$OVERHEAD_APPTO_RHC <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Allowable Costs of RHC 
#---------------------------------------------------
tmp <- x[x$LINE_NUM == 1600,]
build$TOTAL_ALLOWABLECOST_RHCSERVICES <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


#  write.csv(build, "wb_mapped.csv", row.names=FALSE)





