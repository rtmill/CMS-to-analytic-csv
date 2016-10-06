# script to Parse 2552-10 Worksheet M-1
# - Assumes that you have a table of M**R* worksheets labeled "m" 

m1 <- subset(m,  grepl(glob2rx("M1*R*") , WKSHT_CD) )




m1$VAL <- as.character(m1$VAL)
temp <- unique(m1[c("RPT_REC_NUM", "WKSHT_CD")])

temp$WKSHT_CD <- as.character(temp$WKSHT_CD)
temp$SUBPROVIDER <- "x"

for(i in 1:nrow(temp)){
  temp$SUBPROVIDER <- substr(temp$WKSHT_CD, 3, 3)
}

#temp$WKSHT_CD <- as.factor(temp$WKSHT_CD)
m1$WKSHT_CD <- as.character(m1$WKSHT_CD)



# ------ Parse M-1-----------



temp$PHYS_COMP <- ""
temp$PHYS_OTHER <- ""
temp$PHYS_TOTAL <- ""
temp$PHYS_RECLASS <- ""
temp$PHYS_RECLASS_BAL <- ""
temp$PHYS_ADJUST <- ""
temp$PHYS_NET <- ""

temp$PHYS_ASSI_COMP <- ""
temp$PHYS_ASSI_OTHER <- ""
temp$PHYS_ASSI_TOTAL <- ""
temp$PHYS_ASSI_RECLASS <- ""
temp$PHYS_ASSI_RECLASS_BAL <- ""
temp$PHYS_ASSI_ADJUST <- ""
temp$PHYS_ASSI_NET <- ""

temp$NURSE_PRACT_COMP <- ""
temp$NURSE_PRACT_OTHER <- ""
temp$NURSE_PRACT_TOTAL <- ""
temp$NURSE_PRACT_RECLASS <- ""
temp$NURSE_PRACT_RECLASS_BAL <- ""
temp$NURSE_PRACT_ADJUST <- ""
temp$NURSE_PRACT_NET <- ""

temp$VISIT_NURSE_COMP <- ""
temp$VISIT_NURSE_OTHER <- ""
temp$VISIT_NURSE_TOTAL <- ""
temp$VISIT_NURSE_RECLASS <- ""
temp$VISIT_NURSE_RECLASS_BAL <- ""
temp$VISIT_NURSE_ADJUST <- ""
temp$VISIT_NURSE_NET <- ""

temp$OTHER_NURSE_COMP <- ""
temp$OTHER_NURSE_OTHER <- ""
temp$OTHER_NURSE_TOTAL <- ""
temp$OTHER_NURSE_RECLASS <- ""
temp$OTHER_NURSE_RECLASS_BAL <- ""
temp$OTHER_NURSE_ADJUST <- ""
temp$OTHER_NURSE_NET <- ""

temp$PSYCH_COMP <- ""
temp$PSYCH_OTHER <- ""
temp$PSYCH_TOTAL <- ""
temp$PSYCH_RECLASS <- ""
temp$PSYCH_RECLASS_BAL <- ""
temp$PSYCH_ADJUST <- ""
temp$PSYCH_NET <- ""

temp$SOCIAL_COMP <- ""
temp$SOCIAL_OTHER <- ""
temp$SOCIAL_TOTAL <- ""
temp$SOCIAL_RECLASS <- ""
temp$SOCIAL_RECLASS_BAL <- ""
temp$SOCIAL_ADJUST <- ""
temp$SOCIAL_NET <- ""

temp$LABTECH_COMP <- ""
temp$LABTECH_OTHER <- ""
temp$LABTECH_TOTAL <- ""
temp$LABTECH_RECLASS <- ""
temp$LABTECH_RECLASS_BAL <- ""
temp$LABTECH_ADJUST <- ""
temp$LABTECH_NET <- ""

temp$STAFF_OTHER_COMP <- ""
temp$STAFF_OTHER_OTHER <- ""
temp$STAFF_OTHER_TOTAL <- ""
temp$STAFF_OTHER_RECLASS <- ""
temp$STAFF_OTHER_RECLASS_BAL <- ""
temp$STAFF_OTHER_ADJUST <- ""
temp$STAFF_OTHER_NET <- ""

temp$TOTAL_HEALTHCARE_STAFF_COMP <- ""
temp$TOTAL_HEALTHCARE_STAFF_OTHER <- ""
temp$TOTAL_HEALTHCARE_STAFF_TOTAL <- ""
temp$TOTAL_HEALTHCARE_STAFF_RECLASS <- ""
temp$TOTAL_HEALTHCARE_STAFF_RECLASS_BAL <- ""
temp$TOTAL_HEALTHCARE_STAFF_ADJUST <- ""
temp$TOTAL_HEALTHCARE_STAFF_NET <- ""

temp$PHYS_SERV_UA_COMP <- ""
temp$PHYS_SERV_UA_OTHER <- ""
temp$PHYS_SERV_UA_TOTAL <- ""
temp$PHYS_SERV_UA_RECLASS <- ""
temp$PHYS_SERV_UA_BAL <- ""
temp$PHYS_SERV_UA_ADJUST <- ""
temp$PHYS_SERV_UA_NET <- ""

temp$PHYS_SUPR_UA_COMP <- ""
temp$PHYS_SUPR_UA_OTHER <- ""
temp$PHYS_SUPR_UA_TOTAL <- ""
temp$PHYS_SUPR_UA_RECLASS <- ""
temp$PHYS_SUPR_UA_BAL <- ""
temp$PHYS_SUPR_UA_ADJUST <- ""
temp$PHYS_SUPR_UA_NET <- ""

temp$OTHER_UA_COMP <- ""
temp$OTHER_UA_OTHER <- ""
temp$OTHER_UA_TOTAL <- ""
temp$OTHER_UA_RECLASS <- ""
temp$OTHER_UA_BAL <- ""
temp$OTHER_UA_ADJUST <- ""
temp$OTHER_UA_NET <- ""


temp$SUBTOTAL_UA_COMP <- ""
temp$SUBTOTAL_UA_OTHER <- ""
temp$SUBTOTAL_UA_TOTAL <- ""
temp$SUBTOTAL_UA_RECLASS <- ""
temp$SUBTOTAL_UA_BAL <- ""
temp$SUBTOTAL_UA_ADJUST <- ""
temp$SUBTOTAL_UA_NET <- ""


temp$MED_SUPPLIES_COMP <- ""
temp$MED_SUPPLIES_OTHER <- ""
temp$MED_SUPPLIES_TOTAL <- ""
temp$MED_SUPPLIES_RECLASS <- ""
temp$MED_SUPPLIES_BAL <- ""
temp$MED_SUPPLIES_ADJUST <- ""
temp$MED_SUPPLIES_NET <- ""

temp$TRANS_COMP <- ""
temp$TRANS_OTHER <- ""
temp$TRANS_TOTAL <- ""
temp$TRANS_RECLASS <- ""
temp$TRANS_BAL <- ""
temp$TRANS_ADJUST <- ""
temp$TRANS_NET <- ""

temp$DEPREC_MEDEQUIP_COMP <- ""
temp$DEPREC_MEDEQUIP_OTHER <- ""
temp$DEPREC_MEDEQUIP_TOTAL <- ""
temp$DEPREC_MEDEQUIP_RECLASS <- ""
temp$DEPREC_MEDEQUIP_BAL <- ""
temp$DEPREC_MEDEQUIP_ADJUST <- ""
temp$DEPREC_MEDEQUIP_NET <- ""

temp$PLINSUR_COMP <- ""
temp$PLINSUR_OTHER <- ""
temp$PLINSUR_TOTAL <- ""
temp$PLINSUR_RECLASS <- ""
temp$PLINSUR_BAL <- ""
temp$PLINSUR_ADJUST <- ""
temp$PLINSUR_NET <- ""

temp$AGMEPTC_COMP <- ""
temp$AGMEPTC_OTHER <- ""
temp$AGMEPTC_TOTAL <- ""
temp$AGMEPTC_RECLASS <- ""
temp$AGMEPTC_BAL <- ""
temp$AGMEPTC_ADJUST <- ""
temp$AGMEPTC_NET <- ""

temp$OTHERCOSTS_OTHER1_COMP <- ""
temp$OTHERCOSTS_OTHER1_OTHER <- ""
temp$OTHERCOSTS_OTHER1_TOTAL <- ""
temp$OTHERCOSTS_OTHER1_RECLASS <- ""
temp$OTHERCOSTS_OTHER1_BAL <- ""
temp$OTHERCOSTS_OTHER1_ADJUST <- ""
temp$OTHERCOSTS_OTHER1_NET <- ""

temp$TOTAL_OTHERCOSTS_COMP <- ""
temp$TOTAL_OTHERCOSTS_OTHER <- ""
temp$TOTAL_OTHERCOSTS_TOTAL <- ""
temp$TOTAL_OTHERCOSTS_RECLASS <- ""
temp$TOTAL_OTHERCOSTS_BAL <- ""
temp$TOTAL_OTHERCOSTS_ADJUST <- ""
temp$TOTAL_OTHERCOSTS_NET <- ""

temp$TOTAL_COST_SERVICES_COMP <- ""
temp$TOTAL_COST_SERVICES_OTHER <- ""
temp$TOTAL_COST_SERVICES_TOTAL <- ""
temp$TOTAL_COST_SERVICES_RECLASS <- ""
temp$TOTAL_COST_SERVICES_BAL <- ""
temp$TOTAL_COST_SERVICES_ADJUST <- ""
temp$TOTAL_COST_SERVICES_NET <- ""

# ----

# TODO : FINISH FROM HERE        < ---------------------- 

temp$TOTAL_FACILITYCOSTS_COMP <- ""
temp$TOTAL_FACILITYCOSTS_OTHER <- ""
temp$TOTAL_FACILITYCOSTS_TOTAL <- ""
temp$TOTAL_FACILITYCOSTS_RECLASS <- ""
temp$TOTAL_FACILITYCOSTS_BAL <- ""
temp$TOTAL_FACILITYCOSTS_ADJUST <- ""
temp$TOTAL_FACILITYCOSTS_NET <- ""


temp$TOTAL_ADMINCOSTS_COMP <- ""
temp$TOTAL_ADMINCOSTS_OTHER <- ""
temp$TOTAL_ADMINCOSTS_TOTAL <- ""
temp$TOTAL_ADMINCOSTS_RECLASS <- ""
temp$TOTAL_ADMINCOSTS_BAL <- ""
temp$TOTAL_ADMINCOSTS_ADJUST <- ""
temp$TOTAL_ADMINCOSTS_NET <- ""

temp$TOTAL_OVERHEAD_COMP <- ""
temp$TOTAL_OVERHEAD_OTHER <- ""
temp$TOTAL_OVERHEAD_TOTAL <- ""
temp$TOTAL_OVERHEAD_RECLASS <- ""
temp$TOTAL_OVERHEAD_BAL <- ""
temp$TOTAL_OVERHEAD_ADJUST <- ""
temp$TOTAL_OVERHEAD_NET <- ""

# -----

temp$PHARMACY_COMP <- ""
temp$PHARMACY_OTHER <- ""
temp$PHARMACY_TOTAL <- ""
temp$PHARMACY_RECLASS <- ""
temp$PHARMACY_BAL <- ""
temp$PHARMACY_ADJUST <- ""
temp$PHARMACY_NET <- ""

temp$DENTAL_COMP <- ""
temp$DENTAL_OTHER <- ""
temp$DENTAL_TOTAL <- ""
temp$DENTAL_RECLASS <- ""
temp$DENTAL_BAL <- ""
temp$DENTAL_ADJUST <- ""
temp$DENTAL_NET <- ""

temp$OPTOMETRY_COMP <- ""
temp$OPTOMETRY_OTHER <- ""
temp$OPTOMETRY_TOTAL <- ""
temp$OPTOMETRY_RECLASS <- ""
temp$OPTOMETRY_BAL <- ""
temp$OPTOMETRY_ADJUST <- ""
temp$OPTOMETRY_NET <- ""

temp$NAGMEPTC_COMP <- ""
temp$NAGMEPTC_OTHER <- ""
temp$NAGMEPTC_TOTAL <- ""
temp$NAGMEPTC_RECLASS <- ""
temp$NAGMEPTC_BAL <- ""
temp$NAGMEPTC_ADJUST <- ""
temp$NAGMEPTC_NET <- ""

temp$NONRHC_OTHER1_COMP <- ""
temp$NONRHC_OTHER1_OTHER <- ""
temp$NONRHC_OTHER1_TOTAL <- ""
temp$NONRHC_OTHER1_RECLASS <- ""
temp$NONRHC_OTHER1_BAL <- ""
temp$NONRHC_OTHER1_ADJUST <- ""
temp$NONRHC_OTHER1_NET <- ""

temp$TOTAL_NONREIMBURS_COMP <- ""
temp$TOTAL_NONREIMBURS_OTHER <- ""
temp$TOTAL_NONREIMBURS_TOTAL <- ""
temp$TOTAL_NONREIMBURS_RECLASS <- ""
temp$TOTAL_NONREIMBURS_BAL <- ""
temp$TOTAL_NONREIMBURS_ADJUST <- ""
temp$TOTAL_NONREIMBURS_NET <- ""

temp$TOTAL_COSTS_COMP <- ""
temp$TOTAL_COSTS_OTHER <- ""
temp$TOTAL_COSTS_TOTAL <- ""
temp$TOTAL_COSTS_RECLASS <- ""
temp$TOTAL_COSTS_BAL <- ""
temp$TOTAL_COSTS_ADJUST <- ""
temp$TOTAL_COSTS_NET <- ""

# END VARS FOR A




for(i in 1:nrow(temp)){
  x <- m1[m1$RPT_REC_NUM == temp$RPT_REC_NUM[i] & m1$WKSHT_CD == temp$WKSHT_CD[i],]
  
  #---- Physician ----------------------------
  
  y <- x[x$LINE_NUM == 100,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHYS_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PHYS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PHYS_NET[i] <- z$VAL[1]
  }
  
  
#---- Physician Assistant-----------------------------
  
  y <- x[x$LINE_NUM == 200,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_NET[i] <- z$VAL[1]
  }
  
  
#------- Nurse Practitioner -----------------------------
  
  y <- x[x$LINE_NUM == 300,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_NET[i] <- z$VAL[1]
  }
  
  
  #------- Visit Nurse -----------------------------
  
  y <- x[x$LINE_NUM == 400,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_NET[i] <- z$VAL[1]
  }
  
  #------- Other Nurse -----------------------------
  
  y <- x[x$LINE_NUM == 500,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$OTHER_NURSE_NET[i] <- z$VAL[1]
  }
  
  
  #------- Clinical Psychologist -----------------------------
  
  y <- x[x$LINE_NUM == 600,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PSYCH_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PSYCH_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PSYCH_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PSYCH_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PSYCH_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PSYCH_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PSYCH_NET[i] <- z$VAL[1]
  }
  
  
  #------- Clinical Social Worker -----------------------------
  
  y <- x[x$LINE_NUM == 700,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$SOCIAL_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$SOCIAL_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$SOCIAL_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$SOCIAL_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$SOCIAL_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$SOCIAL_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$SOCIAL_NET[i] <- z$VAL[1]
  }
  
  #------- Laboratory Tech -----------------------------
  
  y <- x[x$LINE_NUM == 800,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$LABTECH_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$LABTECH_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$LABTECH_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$LABTECH_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$LABTECH_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$LABTECH_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$LABTECH_NET[i] <- z$VAL[1]
  }
  
  
  
  #------- Other Facility Health Care Staff Costs -----------------------------
  
  y <- x[x$LINE_NUM == 900,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$STAFF_OTHER_NET[i] <- z$VAL[1]
  }
  
  
  #------- Subtotal (1-9) -----------------------------
  
  y <- x[x$LINE_NUM == 1000,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_RECLASS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_HEALTHCARE_STAFF_NET[i] <- z$VAL[1]
  }

 
   
# COSTS UNDER AGREEMENT
  
  
  #------- Physician Services Under Agreement-----------------------------
  
  y <- x[x$LINE_NUM == 1100,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PHYS_SERV_UA_NET[i] <- z$VAL[1]
  }
  
  #------- Physician Supervision Under Agreement-----------------------------
  
  y <- x[x$LINE_NUM == 1200,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PHYS_SUPR_UA_NET[i] <- z$VAL[1]
  }
  
  #------- Other Under Agreement-----------------------------
  
  y <- x[x$LINE_NUM == 1300,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$OTHER_UA_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$OTHER_UA_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$OTHER_UA_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$OTHER_UA_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$OTHER_UA_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$OTHER_UA_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$OTHER_UA_NET[i] <- z$VAL[1]
  }
  
  
  
  #------- Other Under Agreement-----------------------------
  
  y <- x[x$LINE_NUM == 1400,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_NET[i] <- z$VAL[1]
  }
  
  
  
# OTHER HEALTH CARE COSTS
  
  
  #------- Medical Supplies-----------------------------
  
  y <- x[x$LINE_NUM == 1500,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$MED_SUPPLIES_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_UA_NET[i] <- z$VAL[1]
  }
  
  #------- Transportation -----------------------------
  
  y <- x[x$LINE_NUM == 1600,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TRANS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TRANS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TRANS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TRANS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TRANS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TRANS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TRANS_NET[i] <- z$VAL[1]
  }
  
  
  #------- Depreciation : Medical Equipment  -----------------------------
  
  y <- x[x$LINE_NUM == 1700,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$DEPREC_MEDEQUIP_NET[i] <- z$VAL[1]
  }
  
  #------- Professional Liability Insurance  -----------------------------
  
  y <- x[x$LINE_NUM == 1800,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PLINSUR_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PLINSUR_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PLINSUR_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PLINSUR_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PLINSUR_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PLINSUR_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PLINSUR_NET[i] <- z$VAL[1]
  }
  
  #------- Allowable GME Pass Through Costs -----------------------------
  
  y <- x[x$LINE_NUM == 2000,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$AGMEPTC_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$AGMEPTC_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$AGMEPTC_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$AGMEPTC_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$AGMEPTC_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$AGMEPTC_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$AGMEPTC_NET[i] <- z$VAL[1]
  }
  
  #------- Other costs - Other 1 -----------------------------
  
  y <- x[x$LINE_NUM == 1900,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$OTHERCOSTS_OTHER1_NET[i] <- z$VAL[1]
  }
  
  
  #------- Total Othercosts  -----------------------------
  
  y <- x[x$LINE_NUM == 2100,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_OTHERCOSTS_NET[i] <- z$VAL[1]
  }
  
  #------- Total Cost of Services  -----------------------------
  
  y <- x[x$LINE_NUM == 2200,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_COST_SERVICES_NET[i] <- z$VAL[1]
  }
  
  
# FACILITY OVERHEAD 
  
  
  #------- Total Facility Costs -----------------------------
  
  y <- x[x$LINE_NUM == 2900,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_FACILITYCOSTS_NET[i] <- z$VAL[1]
  }
  
  
  #------- Total Administrative Costs -----------------------------
  
  y <- x[x$LINE_NUM == 3000,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_ADMINCOSTS_NET[i] <- z$VAL[1]
  }
  
  
  #------- Total Overhead -----------------------------
  
  y <- x[x$LINE_NUM == 3100,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD_NET[i] <- z$VAL[1]
  }
  
  
  
# COSTS OTHER THAN RHC/FQHC SERVICES 
  
  #------- Pharmacy -----------------------------
  
  y <- x[x$LINE_NUM == 2300,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHARMACY_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHARMACY_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHARMACY_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHARMACY_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHARMACY_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$PHARMACY_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$PHARMACY_NET[i] <- z$VAL[1]
  }
  
  #------- Dental -----------------------------
  
  y <- x[x$LINE_NUM == 2400,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$DENTAL_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$DENTAL_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$DENTAL_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$DENTAL_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PHARMACY_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$DENTAL_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$DENTAL_NET[i] <- z$VAL[1]
  }
  
  #------- Optometry -----------------------------
  
  y <- x[x$LINE_NUM == 2500,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$OPTOMETRY_NET[i] <- z$VAL[1]
  }
  
  #------- Non-Allowable GME Pass Through Costs -----------------------------
  
  y <- x[x$LINE_NUM == 2700,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$NAGMEPTC_NET[i] <- z$VAL[1]
  }
  
  #------- Other - All other nonreimbursable costs -----------------------------
  
  y <- x[x$LINE_NUM == 2600,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$NONRHC_OTHER1_NET[i] <- z$VAL[1]
  }
  
  #------- Subtotal - Non-reimbursable Costs  -----------------------------
  
  y <- x[x$LINE_NUM == 2800,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_NONREIMBURS_NET[i] <- z$VAL[1]
  }
  
  #------- Total Costs  -----------------------------
  
  y <- x[x$LINE_NUM == 3200,]
  
  # Comp
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_COMP[i] <- z$VAL[1]
  }
  
  # Other
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_OTHER[i] <- z$VAL[1]
  }
  
  # Total
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_TOTAL[i] <- z$VAL[1]
  }
  
  # Reclass
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_RECLASS[i] <- z$VAL[1]
  }
  
  # Reclass Balance
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_BAL[i] <- z$VAL[1]
  }
  
  # Adjust
  z <- y[y$CLMN_NUM == 600,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_ADJUST[i] <- z$VAL[1]
  }
  
  # Net
  z <- y[y$CLMN_NUM == 700,]
  if (nrow(z) > 0){
    temp$TOTAL_COSTS_NET[i] <- z$VAL[1]
  }
  
  
  
}
  

