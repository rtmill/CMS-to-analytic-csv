# script to Parse 2552-10 Worksheet M-2
# - Assumes that you have a table of M**R* worksheets labeled "m" 

m2 <- subset(m,  grepl(glob2rx("M2*R*") , WKSHT_CD) )


m2$VAL <- as.character(m2$VAL)
temp <- unique(m2[c("RPT_REC_NUM", "WKSHT_CD")])

temp$WKSHT_CD <- as.character(temp$WKSHT_CD)
temp$SUBPROVIDER <- "x"

for(i in 1:nrow(temp)){
  temp$SUBPROVIDER <- substr(temp$WKSHT_CD, 3, 3)
}

#temp$WKSHT_CD <- as.factor(temp$WKSHT_CD)
m2$WKSHT_CD <- as.character(m2$WKSHT_CD)


# Define variables names - matches columns of wb_mapped.csv -  from PARSE_B.R ( CMS-222-92 )
#------------------------------------------------------------------------------------------

# M2 -> B1 


temp$PHYS_NUMFTE <- ""
temp$PHYS_TOTALVISITS <- ""
temp$PHYS_PRODSTANDARD <- ""
temp$PHYS_MINVISITS <- ""

temp$PHYS_ASSI_NUMFTE <- ""
temp$PHYS_ASSI_TOTALVISITS <- ""
temp$PHYS_ASSI_PRODSTANDARD <- ""
temp$PHYS_ASSI_MINVISITS <- ""

temp$NURSE_PRACT_NUMFTE <- ""
temp$NURSE_PRACT_TOTALVISITS <- ""
temp$NURSE_PRACT_PRODSTANDARD <- ""
temp$NURSE_PRACT_MINVISITS <- ""


temp$SUBTOTAL_NUMFTE <- ""
temp$SUBTOTAL_TOTALVISITS <- ""
temp$SUBTOTAL_MINVISITS <- ""
temp$SUBTOTAL_GREATEROF <- ""

temp$VISIT_NURSE_NUMFTE <- ""
temp$VISIT_NURSE_TOTALVISITS <- ""
temp$VISIT_NURSE_GREATEROF <- ""

temp$PSYCH_NUMFTE <- ""
temp$PSYCH_TOTALVISITS <- ""
temp$PSYCH_GREATEROF <- ""

temp$SOCIAL_NUMFTE <- ""
temp$SOCIAL_TOTALVISITS <- ""
temp$SOCIAL_GREATEROF <- ""

temp$NUTRTHERA_NUMFTE <- ""
temp$NUTRTHERA_TOTALVISITS <- ""
temp$NUTRTHERA_GREATEROF <- ""

temp$DSMT_NUMFTE <- ""
temp$DSMT_TOTALVISITS <- ""
temp$DSMT_GREATEROF <- ""

temp$TOTALSTAFF_NUMFTE <- ""
temp$TOTALSTAFF_TOTALVISITS <- ""
temp$TOTALSTAFF_GREATEROF <- ""

temp$PSUA_TOTALVISITS <- ""
temp$PSUA_GREATEROF <- ""


# M2 -> B2 

temp$RHCSERVICES_EXCLUDINGOVERHEAD <- ""
temp$NONRHCSERVICES_EXCLUDINGOVERHEAD <- ""
temp$ALLSERVICES_EXCLUDINGOVERHEAD <- ""
temp$RATIO_RHCSERVICES  <- ""
temp$TOTAL_OVERHEAD <- ""
temp$ALLOWABLE_GME_OVERHEAD <- ""
temp$NET_FACILITY_OVERHEAD <- ""
temp$OVERHEAD_APPTO_RHC <- ""
temp$TOTAL_ALLOWABLECOST_RHCSERVICES <- ""


# Begin Mapping
# - each row is a unique (report record number, worksheet code) tuple 

for(i in 1:nrow(temp)){
  x <- m2[m2$RPT_REC_NUM == temp$RPT_REC_NUM[i] & m2$WKSHT_CD == temp$WKSHT_CD[i],]

  #---- Physician ----------------------------
  
  y <- x[x$LINE_NUM == 100,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Productivity Standard
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_PRODSTANDARD[i] <- z$VAL[1]
  }
  
  # Minimum Visits
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_MINVISITS[i] <- z$VAL[1]
  }
  
  #---- Physician Assistant ----------------------------
  
  y <- x[x$LINE_NUM == 200,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Productivity Standard
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_PRODSTANDARD[i] <- z$VAL[1]
  }
  
  # Minimum Visits
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$PHYS_ASSI_MINVISITS[i] <- z$VAL[1]
  }
  
  #---- Nurse Practitioner ----------------------------
  
  y <- x[x$LINE_NUM == 300,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Productivity Standard
  z <- y[y$CLMN_NUM == 300,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_PRODSTANDARD[i] <- z$VAL[1]
  }
  
  # Minimum Visits
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$NURSE_PRACT_MINVISITS[i] <- z$VAL[1]
  }
  
  #---- Subtotal  ----------------------------
  
  y <- x[x$LINE_NUM == 400,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Minimum Visits
  z <- y[y$CLMN_NUM == 400,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_MINVISITS[i] <- z$VAL[1]
  }

  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$SUBTOTAL_GREATEROF[i] <- z$VAL[1]
  }

  #---- Visiting Nurse   ----------------------------
  
  y <- x[x$LINE_NUM == 500,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$VISIT_NURSE_GREATEROF[i] <- z$VAL[1]
  }
  
  #----  Clinical Psychologist    ----------------------------
  
  y <- x[x$LINE_NUM == 700,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$PSYCH_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PSYCH_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PSYCH_GREATEROF[i] <- z$VAL[1]
  }
  
  #----  Clinical Social Worker    ----------------------------
  
  y <- x[x$LINE_NUM == 700,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$SOCIAL_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$SOCIAL_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$SOCIAL_GREATEROF[i] <- z$VAL[1]
  }
  
  
  #----   Medical Nutrition Therapist    ----------------------------
  
  y <- x[x$LINE_NUM == 701,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$NUTRTHERA_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$NUTRTHERA_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$NUTRTHERA_GREATEROF[i] <- z$VAL[1]
  }
  
  
  #----   Diabetes Self Management Training   ----------------------------
  
  y <- x[x$LINE_NUM == 702,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$DSMT_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$DSMT_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$DSMT_GREATEROF[i] <- z$VAL[1]
  }
  
  
  #----   Total Staff  ----------------------------
  
  y <- x[x$LINE_NUM == 800,]
  
  # Number of FTE Personnel
  z <- y[y$CLMN_NUM == 100,]
  if (nrow(z) > 0){
    temp$TOTALSTAFF_NUMFTE[i] <- z$VAL[1]
  }
  
  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$TOTALSTAFF_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$TOTALSTAFF_GREATEROF[i] <- z$VAL[1]
  }
  
  
  #----   Physician Services Under Agreement  ----------------------------
  
  y <- x[x$LINE_NUM == 900,]
  

  # Total Visits
  z <- y[y$CLMN_NUM == 200,]
  if (nrow(z) > 0){
    temp$PSUA_TOTALVISITS[i] <- z$VAL[1]
  }
  
  # Greater of 2 or 4
  z <- y[y$CLMN_NUM == 500,]
  if (nrow(z) > 0){
    temp$PSUA_GREATEROF[i] <- z$VAL[1]
  }
  
  
  
  # -- M2 -> B2 Mapping 
  
  
  y <- x[x$CLMN_NUM == 100,]
  
  # Cost of RHC Services - Excluding Overhead
  z <- y[y$LINE_NUM == 1000,]
  if (nrow(z) > 0){
    temp$RHCSERVICES_EXCLUDINGOVERHEAD[i] <- z$VAL[1]
  }
  
  # Cost of Non-RHC Services - Excluding Overhead
  z <- y[y$LINE_NUM == 1100,]
  if (nrow(z) > 0){
    temp$NONRHCSERVICES_EXCLUDINGOVERHEAD[i] <- z$VAL[1]
  }
  
  # Cost of all services 
  z <- y[y$LINE_NUM == 1200,]
  if (nrow(z) > 0){
    temp$ALLSERVICES_EXCLUDINGOVERHEAD[i] <- z$VAL[1]
  }
  
  # Ratio of RHC/FQHC Services
  z <- y[y$LINE_NUM == 1300,]
  if (nrow(z) > 0){
    temp$RATIO_RHCSERVICES [i] <- z$VAL[1]
  }
  
  # Total Overhead
  z <- y[y$LINE_NUM == 1600,]
  if (nrow(z) > 0){
    temp$TOTAL_OVERHEAD[i] <- z$VAL[1]
  }
  
  # Total allowable GME Overhead
  z <- y[y$LINE_NUM == 1700,]
  if (nrow(z) > 0){
    temp$ALLOWABLE_GME_OVERHEAD[i] <- z$VAL[1]
  }
  
  # Net facility overhead costs 
  z <- y[y$LINE_NUM == 1400,]
  if (nrow(z) > 0){
    temp$NET_FACILITY_OVERHEAD[i] <- z$VAL[1]
  }
  
  # Overhead applicable to RHC/FQHC Services 
  z <- y[y$LINE_NUM == 1900,]
  if (nrow(z) > 0){
    temp$OVERHEAD_APPTO_RHC[i] <- z$VAL[1]
  }
  
  # total Allowable costs of RHC/FQHC Services 
  z <- y[y$LINE_NUM == 2000,]
  if (nrow(z) > 0){
    temp$TOTAL_ALLOWABLECOST_RHCSERVICES[i] <- z$VAL[1]
  }
  
}



