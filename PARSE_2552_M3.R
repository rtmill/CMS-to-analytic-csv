# script to Parse 2552-10 Worksheet M-3
# - Assumes that you have a table of M**R* worksheets labeled "m" 




# ****** TODO : All NA for some variables if they arent medicare (XXXR18X). Limit to just medicare? 


m3 <- subset(m,  grepl(glob2rx("M3*R*") , WKSHT_CD) )


m3$VAL <- as.character(m3$VAL)
temp <- unique(m3[c("RPT_REC_NUM", "WKSHT_CD")])

temp$WKSHT_CD <- as.character(temp$WKSHT_CD)
temp$SUBPROVIDER <- ""
temp$TITLE <- ""

for(i in 1:nrow(temp)){
  temp$SUBPROVIDER <- substr(temp$WKSHT_CD, 3, 3)
  temp$TITLE <- substr(temp$WKSHT_CD, 5, 6)
}

#temp$WKSHT_CD <- as.factor(temp$WKSHT_CD)
m3$WKSHT_CD <- as.character(m3$WKSHT_CD)




# Define variables names - matches columns of wc_mapped.csv -  from PARSE_c.R ( CMS-222-92 )
#------------------------------------------------------------------------------------------

temp$TOTAL_ALLOWABLE_COSTS <- ""

temp$PAIV <- ""

temp$TOTAL_ALLOWABLE_COSTS_EXCLUDINGPAIV <- ""

temp$GREATEROF_MINACTUALVISITS <- ""

temp$PHYSVISITS_UNDERAGREEMENT <- ""

temp$TOTAL_ADJUSTED_VISITS <- ""   

temp$ADJUSTED_COST_PER_VISIT <- ""   

temp$MAXRATE_PERVISIT_PER1 <- ""   # <-------------- START HERE 
temp$MAXRATE_PERVISIT_PER2 <- ""

temp$RATE_MEDICAREVISITS_PER1 <- ""
temp$RATE_MEDICAREVISITS_PER2 <- ""

temp$MEDICARE_VISITS_NONMENTAL_PER1 <- ""
temp$MEDICARE_VISITS_NONMENTAL_PER2 <- ""

temp$MEDICARE_COSTS_NONMENTAL_PER1 <- ""
temp$MEDICARE_COSTS_NONMENTAL_PER2 <- ""

temp$MEDICARE_VISITS_MENTAL_PER1 <- ""
temp$MEDICARE_VISITS_MENTAL_PER2 <- ""

temp$MEDICARE_COSTS_MENTAL_PER1 <- ""
temp$MEDICARE_COSTS_MENTAL_PER2 <- ""

temp$LIMIT_ADJUSTMENT_PER1 <- ""
temp$LIMIT_ADJUSTMENT_PER2 <- ""

temp$GRAD_MEDEDU_PER1 <- ""
temp$GRAD_MEDEDU_PER2 <- ""

temp$TOTAL_MEDICARE_COSTS_PER1 <- ""
temp$TOTAL_MEDICARE_COSTS_PER2 <- ""

temp$LESS_BENEFDEDUCT_PER2 <- ""

temp$NET_MEDICARE_COSTS_NONPIAV_PER2 <- ""

temp$TOTAL_MEDICARE_CHARGES_PER1 <- ""
temp$TOTAL_MEDICARE_CHARGES_PER2 <- ""

temp$TOTAL_MEDICARE_PREVENT_CHARGES_PER1 <- ""
temp$TOTAL_MEDICARE_PREVENT_CHARGES_PER2 <- ""

temp$TOTAL_MEDICARE_PREVENT_COSTS_PER1 <- ""
temp$TOTAL_MEDICARE_PREVENT_COSTS_PER2 <- ""

temp$TOTAL_MEDICARE_NONPREVENT_COSTS_PER1 <- ""
temp$TOTAL_MEDICARE_NONPREVENT_COSTS_PER2 <- ""

temp$NET_MEDICARE_COST_PER1 <- ""
temp$NET_MEDICARE_COST_PER2 <- ""

# end repeated columns 

temp$BENEF_COINSUR_PER2 <- ""

temp$REIMBURS_RHC_NONPIAV <- ""

temp$MEDICARE_COST_PIAV <- ""

temp$OTHER_ADJUSTMENTS <- ""

temp$TOTAL_REIMBURS_MEDICARE_COST <- ""

temp$LESS_PAYMENTSTO_RHC <- ""

temp$BALANCE_MEDICARE_NONBADDEBTS <- ""

temp$TOTAL_REIMBURS_BADDEBTS <- ""

temp$TOTAL_REIMBURS_BADDEBTS_DEB <- ""

temp$TENTATIVE_SETTLEMENT <- ""

# --- DO NOT EXIST 
#temp$ADJUSTED_REIMBURS_BADDEBTS <- ""
#temp$SEQUESTRATION_ADJUSTMENT <- ""

temp$TOTAL_DUE_TOFROM_MEDICARE <- ""



for(i in 1:nrow(temp)){
  x <- m3[m3$RPT_REC_NUM == temp$RPT_REC_NUM[i] & m3$WKSHT_CD == temp$WKSHT_CD[i],]
  
  y <- x[x$CLMN_NUM == 100, ]
  
  # Total Allowable Cost of RHC/FQHC Services 
  z <- y[y$LINE_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_ALLOWABLE_COSTS[i] <- z$VAL[1]
  }
  
  # Cost of vaccines and their administration
  z <- y[y$LINE_NUM == 200,]
  if (nrow(z) > 0){
    temp$PAIV[i] <- z$VAL[1]
  }
  
  # Total allowable cost excluding vaccine 
  z <- y[y$LINE_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_ALLOWABLE_COSTS_EXCLUDINGPAIV[i] <- z$VAL[1]
  }
  # Greater of 
  z <- y[y$LINE_NUM == 400,]
  if (nrow(z) > 0){
    temp$GREATEROF_MINACTUALVISITS[i] <- z$VAL[1]
  }
  
  
  # Physician Visits under agreement 
  z <- y[y$LINE_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHYSVISITS_UNDERAGREEMENT[i] <- z$VAL[1]
  }
  
  # Total Adjusted Visits  
  z <- y[y$LINE_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_ADJUSTED_VISITS[i] <- z$VAL[1]
  }
  
  # Adjusted Cost Per Visit 
  z <- y[y$LINE_NUM == 700,]
  if (nrow(z) > 0){
    temp$ADJUSTED_COST_PER_VISIT[i] <- z$VAL[1]
  }
  
  
# - START MULTIPLE COLUMN SECTION 
  
  # --- Max Rate Per Visit ---
  
  y <- x[x$LINE_NUM == 800, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$MAXRATE_PERVISIT_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MAXRATE_PERVISIT_PER2[i] <- z$VAL[1]
  }
  
  
  # --- Rate for Medicare Covered Visits ---
  
  y <- x[x$LINE_NUM == 900, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$RATE_MEDICAREVISITS_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$RATE_MEDICAREVISITS_PER2[i] <- z$VAL[1]
  }
  
  # --- Medicare Covered Visits (excluding mental health) ---
  
  y <- x[x$LINE_NUM == 1000, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$MEDICARE_VISITS_NONMENTAL_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MEDICARE_VISITS_NONMENTAL_PER2[i] <- z$VAL[1]
  }
  
  # --- Medicare Cost (excluding mental health) ---
  
  y <- x[x$LINE_NUM == 1100, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$MEDICARE_COSTS_NONMENTAL_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MEDICARE_COSTS_NONMENTAL_PER2[i] <- z$VAL[1]
  }
  
  # --- Medicare covered visits for mental health ---
  
  y <- x[x$LINE_NUM == 1200, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$MEDICARE_VISITS_MENTAL_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MEDICARE_VISITS_MENTAL_PER2[i] <- z$VAL[1]
  }
  
  # --- medicare covered costs for mental health ---
  
  y <- x[x$LINE_NUM == 1300, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$MEDICARE_COSTS_MENTAL_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MEDICARE_COSTS_MENTAL_PER2[i] <- z$VAL[1]
  }
  
  # --- Limit adjustment ---
  
  y <- x[x$LINE_NUM == 1400, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$LIMIT_ADJUSTMENT_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$LIMIT_ADJUSTMENT_PER1[i] <- z$VAL[1]
  }
  
  
  # --- Graduate medical education pass through cost ---
  
  y <- x[x$LINE_NUM == 1500, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$GRAD_MEDEDU_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$GRAD_MEDEDU_PER2[i] <- z$VAL[1]
  }
  
  # --- total medicare cost ---
  
  y <- x[x$LINE_NUM == 1600, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_COSTS_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_COSTS_PER2[i] <- z$VAL[1]
  }
  
  # --- Less: beneficiary deductible for RHC  ---
  
  y <- x[x$LINE_NUM == 1800, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$LESS_BENEFDEDUCT_PER2[i] <- z$VAL[1]
  }
  
  # ---Net medicare cost excluding Pneumococcal & Influenze Vaccine  ---
  
  y <- x[x$LINE_NUM == 2000, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$NET_MEDICARE_COSTS_NONPIAV_PER2[i] <- z$VAL[1]
  }
  
  
  # ---Total medicare charges  ---
  
  y <- x[x$LINE_NUM == 1601, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_CHARGES_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_CHARGES_PER2[i] <- z$VAL[1]
  }
  
  
  # ---Total medicare preventive charges  ---
  
  y <- x[x$LINE_NUM == 1602, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_PREVENT_CHARGES_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_PREVENT_CHARGES_PER2[i] <- z$VAL[1]
  }
  
  # ---Total medicare preventive costs  ---
  
  y <- x[x$LINE_NUM == 1603, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_PREVENT_COSTS_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_PREVENT_COSTS_PER2[i] <- z$VAL[1]
  }
  
  # ---Total medicare non-preventive costs  ---
  
  y <- x[x$LINE_NUM == 1604, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_NONPREVENT_COSTS_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_MEDICARE_NONPREVENT_COSTS_PER2[i] <- z$VAL[1]
  }
  
  # ---Net medicare costs  ---
  
  y <- x[x$LINE_NUM == 1605, ]
  z <- y[y$CLMN_NUM == 100, ]
  if (nrow(z) > 0){
    temp$NET_MEDICARE_COST_PER1[i] <- z$VAL[1]
  }
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$NET_MEDICARE_COST_PER2[i] <- z$VAL[1]
  }
  
  
  
  
  #-------- END MULTIPLE COLUMN VALUES ----------- 
  
  
  # --- Beneficiary coinsurance for RHC / FQHC  ---
  
  y <- x[x$LINE_NUM == 1900, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$BENEF_COINSUR_PER2[i] <- z$VAL[1]
  }
  

  # -  Reimbursable cost (other than vaccines)
  
  y <- x[x$LINE_NUM == 2000, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$REIMBURS_RHC_NONPIAV[i] <- z$VAL[1]
  }
  
  
  # -  Cost of P&I Vaccine and Admin
  
  y <- x[x$LINE_NUM == 2100, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$MEDICARE_COST_PIAV[i] <- z$VAL[1]
  }
  
  # -  OTHER_ADJUSTMENTS
  
  y <- x[x$LINE_NUM == 2500, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$OTHER_ADJUSTMENTS[i] <- z$VAL[1]
  }
  
  # -  TOTAL_REIMBURS_MEDICARE_COST
  
  y <- x[x$LINE_NUM == 2200, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_REIMBURS_MEDICARE_COST[i] <- z$VAL[1]
  }
  
  # -less payments to RHC / FQHC during reporting period 
  
  y <- x[x$LINE_NUM == 2700, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$LESS_PAYMENTSTO_RHC[i] <- z$VAL[1]
  }
  
  # -balance due to/from the medicare program exclusive of bad debts
  
  y <- x[x$LINE_NUM == 2600, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$BALANCE_MEDICARE_NONBADDEBTS[i] <- z$VAL[1]
  }
  
  
  # -total reimbursable bad debts, net of bad debt recoveries
  
  y <- x[x$LINE_NUM == 2300, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_REIMBURS_BADDEBTS[i] <- z$VAL[1]
  }
  
  

  
  
  # -total amount due to/from the medicare program
  
  y <- x[x$LINE_NUM == 2900, ]
  z <- y[y$CLMN_NUM == 200, ]
  if (nrow(z) > 0){
    temp$TOTAL_DUE_TOFROM_MEDICARE[i] <- z$VAL[1]
  }
  
}



# Change from character columns to integer

for(i in 5:ncol(temp)){
  temp[,i] <- as.integer(temp[,i])
}








