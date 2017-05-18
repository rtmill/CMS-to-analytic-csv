# Script to parse Worksheet C


x  <- both[both$WKSHT_CD == "C000001",]

build <- data.frame(unique(x$RPT_REC_NUM))
names(build) <- "RPT_REC_NUM"





# ---- Part I - Determination of Rate for RHC/FQHC Services ----------------


# get Total Allowable Costs
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 100 & x$CLMN_NUM == 100,]
build$TOTAL_ALLOWABLE_COSTS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Cost of Pneumococcal and Influenza Vaccine and its administration 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 200 & x$CLMN_NUM == 100,]
build$PAIV <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Allowable Costs excluding PAIV
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 300 & x$CLMN_NUM == 100,]
build$TOTAL_ALLOWABLE_COSTS_EXCLUDINGPAIV <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Greater of minimum visits or actual visits by health care staff
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 400 & x$CLMN_NUM == 100,]
build$GREATEROF_MINACTUALVISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Physicians Visits Under Agreement 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 500 & x$CLMN_NUM == 100,]
build$PHYSVISITS_UNDERAGREEMENT <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Adjusted Visits 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 600 & x$CLMN_NUM == 100,]
build$TOTAL_ADJUSTED_VISITS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Adjusted Cost Per Visit 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 700 & x$CLMN_NUM == 100,]
build$ADJUSTED_COST_PER_VISIT <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# // start rate period section 


# get Maximum Rate Per Visit 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 100,]
build$MAXRATE_PERVISIT_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 200,]
build$MAXRATE_PERVISIT_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 800 & x$CLMN_NUM == 201,]
build$MAXRATE_PERVISIT_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Rate for Medicare Covered Visits 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 100,]
build$RATE_MEDICAREVISITS_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 200,]
build$RATE_MEDICAREVISITS_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 900 & x$CLMN_NUM == 201,]
build$RATE_MEDICAREVISITS_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# Start Worksheet C Part II


# // Rate for Medicare Covered Visits repeated here, excluded 


# get Medicare Covered Visits excluding Mental Health 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 100,]
build$MEDICARE_VISITS_NONMENTAL_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 200,]
build$MEDICARE_VISITS_NONMENTAL_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 201,]
build$MEDICARE_VISITS_NONMENTAL_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1100 & x$CLMN_NUM == 300,]
build$MEDICARE_VISITS_NONMENTAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Medicare Covered COSTS excluding Mental Health 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 100,]
build$MEDICARE_COSTS_NONMENTAL_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 200,]
build$MEDICARE_COSTS_NONMENTAL_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 201,]
build$MEDICARE_COSTS_NONMENTAL_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1200 & x$CLMN_NUM == 300,]
build$MEDICARE_COSTS_NONMENTAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Medicare Covered VisIts for mental health 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 100,]
build$MEDICARE_VISITS_MENTAL_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 200,]
build$MEDICARE_VISITS_MENTAL_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 201,]
build$MEDICARE_VISITS_MENTAL_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1300 & x$CLMN_NUM == 300,]
build$MEDICARE_VISITS_MENTAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Medicare Covered COSTS FOR Mental Health 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 100,]
build$MEDICARE_COSTS_MENTAL_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 200,]
build$MEDICARE_COSTS_MENTAL_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 201,]
build$MEDICARE_COSTS_MENTAL_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1400 & x$CLMN_NUM == 300,]
build$MEDICARE_COSTS_MENTAL_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Limit Adjustment 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 100,]
build$LIMIT_ADJUSTMENT_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 200,]
build$LIMIT_ADJUSTMENTL_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 201,]
build$LIMIT_ADJUSTMENTL_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1500 & x$CLMN_NUM == 300,]
build$LIMIT_ADJUSTMENT_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Graduate MEdical Education Pass Through Cost 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1510 & x$CLMN_NUM == 100,]
build$GRAD_MEDEDU_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1510 & x$CLMN_NUM == 200,]
build$GRAD_MEDEDU_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1510 & x$CLMN_NUM == 201,]
build$GRAD_MEDEDU_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1510 & x$CLMN_NUM == 300,]
build$GRAD_MEDEDU_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Total Medicare Costs
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 100,]
build$TOTAL_MEDICARE_COSTS_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 200,]
build$TOTAL_MEDICARE_COSTS_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 201,]
build$TOTAL_MEDICARE_COSTS_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1600 & x$CLMN_NUM == 300,]
build$TOTAL_MEDICARE_COSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Less: Beneficiary Deductible 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 100,]
build$LESS_BENEFDEDUCT_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 200,]
build$LESS_BENEFDEDUCT_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 201,]
build$LESS_BENEFDEDUCT_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1700 & x$CLMN_NUM == 300,]
build$LESS_BENEFDEDUCT_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Net medicare costs excluding PIAV 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 100,]
build$NET_MEDICARE_COSTS_NONPIAV_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 200,]
build$NET_MEDICARE_COSTS_NONPIAV_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 201,]
build$NET_MEDICARE_COSTS_NONPIAV_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1800 & x$CLMN_NUM == 300,]
build$NET_MEDICARE_COSTS_NONPIAV_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Medicare Charges
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1801 & x$CLMN_NUM == 100,]
build$TOTAL_MEDICARE_CHARGES_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1801 & x$CLMN_NUM == 200,]
build$TOTAL_MEDICARE_CHARGES_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1801 & x$CLMN_NUM == 201,]
build$TOTAL_MEDICARE_CHARGES_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1801 & x$CLMN_NUM == 300,]
build$TOTAL_MEDICARE_CHARGES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Medicare Preventative Charges
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1802 & x$CLMN_NUM == 100,]
build$TOTAL_MEDICARE_PREVENT_CHARGES_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1802 & x$CLMN_NUM == 200,]
build$TOTAL_MEDICARE_PREVENT_CHARGES_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1802 & x$CLMN_NUM == 201,]
build$TOTAL_MEDICARE_PREVENT_CHARGES_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1802 & x$CLMN_NUM == 300,]
build$TOTAL_MEDICARE_PREVENT_CHARGES_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Medicare Preventative Costs
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1803 & x$CLMN_NUM == 100,]
build$TOTAL_MEDICARE_PREVENT_COSTS_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1803 & x$CLMN_NUM == 200,]
build$TOTAL_MEDICARE_PREVENT_COSTS_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1803 & x$CLMN_NUM == 201,]
build$TOTAL_MEDICARE_PREVENT_COSTS_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1803 & x$CLMN_NUM == 300,]
build$TOTAL_MEDICARE_PREVENT_COSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Total Medicare non-Preventative costs
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1804 & x$CLMN_NUM == 100,]
build$TOTAL_MEDICARE_NONPREVENT_COSTS_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1804 & x$CLMN_NUM == 200,]
build$TOTAL_MEDICARE_NONPREVENT_COSTS_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1804 & x$CLMN_NUM == 201,]
build$TOTAL_MEDICARE_NONPREVENT_COSTS_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1804 & x$CLMN_NUM == 300,]
build$TOTAL_MEDICARE_NONPREVENT_COSTS_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# get Net Medicare Cost
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 100,]
build$NET_MEDICARE_COST_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 200,]
build$NET_MEDICARE_COST_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 201,]
build$NET_MEDICARE_COST_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 300,]
build$NET_MEDICARE_COST_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])




# get Beneficiary Coinsurance for RHC/FQHC services 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 100,]
build$BENEF_COINSUR_PER1 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 200,]
build$BENEF_COINSUR_PER2 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 201,]
build$BENEF_COINSUR_PER3 <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

tmp <- x[x$LINE_NUM == 1805 & x$CLMN_NUM == 300,]
build$BENEF_COINSUR_TOTAL <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])





# -- / End rate period section ---------- #


# get Reimbursable Cost of RHC/FQHC Services, other than PIAV 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 1900 & x$CLMN_NUM == 300,]
build$REIMBURS_RHC_NONPIAV <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Medicare Cost of PIAV 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2000 & x$CLMN_NUM == 300,]
build$MEDICARE_COST_PIAV <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Other Adjustments 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2050 & x$CLMN_NUM == 300,]
build$OTHER_ADJUSTMENTS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Total Reimbursable Medicare Cost
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2100 & x$CLMN_NUM == 300,]
build$TOTAL_REIMBURS_MEDICARE_COST <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Less Payments to RHC during reporting period 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2200 & x$CLMN_NUM == 300,]
build$LESS_PAYMENTSTO_RHC <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])


# get Balance to/from medicare, excluding bad debts 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2300 & x$CLMN_NUM == 300,]
build$BALANCE_MEDICARE_NONBADDEBTS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Total reimbursable bad debts, net of bad debts recoveries 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2400 & x$CLMN_NUM == 300,]
build$TOTAL_REIMBURS_BADDEBTS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Total gross reimbursable bad debts for dual eligible beneficiaries  
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2401 & x$CLMN_NUM == 300,]
build$TOTAL_REIMBURS_BADDEBTS_DEB <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Tentative Settlement 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2402 & x$CLMN_NUM == 300,]
build$TENTATIVE_SETTLEMENT <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get Adjusted Reimbursable bad debts 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2410 & x$CLMN_NUM == 300,]
build$ADJUSTED_REIMBURS_BADDEBTS <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get sequestratrion adjustment 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2411 & x$CLMN_NUM == 300,]
build$SEQUESTRATION_ADJUSTMENT <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])

# get total amount due/to the medicare program 
#-------------------------------------------------
tmp <- x[x$LINE_NUM == 2500 & x$CLMN_NUM == 300,]
build$TOTAL_DUE_TOFROM_MEDICARE <- with(tmp, tmp$VAL[match(build$RPT_REC_NUM,tmp$RPT_REC_NUM)])



# -- FINISH WORKSHEET C 

# write.csv(build, "wc_mapped.csv", row.names = FALSE)

# Change from character columns to integer

for(i in 2:ncol(build)){
  build[,i] <- as.character(build[,i])
  build[,i] <- as.integer(build[,i])
}



