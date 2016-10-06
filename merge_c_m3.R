# Script to merge C-1 w/ m3
# -- assumes you have tables c and m3 loaded


# Add source 
# c
df <- data.frame(c[,1])
names(df)[1] <- "RPT_REC_NUM"
df$TYPE <- "INDEPENDENT"
df$SUBPROVIDER <- 0
df$TITLE <- 0
df <- cbind(df, c[,2:8])

#m3 
df2 <- data.frame(m3[,1])
names(df2)[1] <- "RPT_REC_NUM"
df2$TYPE <- "PROVIDER"
df2 <- cbind(df2, m3[,3:11])

# Parse and merge mutual columns
# c
# Add the columns that dont have sums ( max rate and medicare rate)
df <- cbind(df, c[,c(9:10,12:13)])
# Add totals columns (distinct to c)
df <- cbind(df, c[,c(18,22,26,30,34,38,42,46,50,54,58,62,66,70,74)])
# Add remaining columns
df <- cbind(df, c[,c(75:83,86)])


# m3
# Add the columns that dont have sums ( max rate and medicare rate)
df2 <- cbind(df2, m3[,12:15])

# Sum periods
df2$MEDICARE_VISITS_NONMENTAL_TOTAL <- rowSums(cbind(m3$MEDICARE_VISITS_NONMENTAL_PER1, m3$MEDICARE_VISITS_NONMENTAL_PER2), na.rm=TRUE)
df2$MEDICARE_COSTS_NONMENTAL_TOTAL  <- rowSums(cbind(m3$MEDICARE_COSTS_NONMENTAL_PER1, m3$MEDICARE_COSTS_NONMENTAL_PER2), na.rm=TRUE)
df2$MEDICARE_VISITS_MENTAL_TOTAL    <- rowSums(cbind(m3$MEDICARE_VISITS_MENTAL_PER1, m3$MEDICARE_VISITS_MENTAL_PER2), na.rm=TRUE)
df2$MEDICARE_COSTS_MENTAL_TOTAL  <- rowSums(cbind(m3$MEDICARE_COSTS_MENTAL_PER1, m3$MEDICARE_COSTS_MENTAL_PER2), na.rm=TRUE)
df2$LIMIT_ADJUSTMENT_TOTAL    <- rowSums(cbind(m3$LIMIT_ADJUSTMENT_PER1, m3$LIMIT_ADJUSTMENT_PER2), na.rm=TRUE)
df2$GRAD_MEDEDU_TOTAL                  <- rowSums(cbind(m3$GRAD_MEDEDU_PER1, m3$GRAD_MEDEDU_PER2), na.rm=TRUE)
df2$TOTAL_MEDICARE_COSTS_TOTAL   <- rowSums(cbind(m3$TOTAL_MEDICARE_COSTS_PER1, m3$TOTAL_MEDICARE_COSTS_PER2), na.rm=TRUE)
df2$LESS_BENEFDEDUCT_TOTAL   <- rowSums(cbind(m3$LESS_BENEFDEDUCT_PER1, m3$LESS_BENEFDEDUCT_PER2), na.rm=TRUE)
df2$NET_MEDICARE_COSTS_NONPIAV_TOTAL     <- rowSums(cbind(m3$NET_MEDICARE_COSTS_NONPIAV_PER1, m3$NET_MEDICARE_COSTS_NONPIAV_PER2), na.rm=TRUE)
df2$TOTAL_MEDICARE_CHARGES_TOTAL       <- rowSums(cbind(m3$TOTAL_MEDICARE_CHARGES_PER1, m3$TOTAL_MEDICARE_CHARGES_PER2), na.rm=TRUE)
df2$TOTAL_MEDICARE_PREVENT_CHARGES_TOTAL   <- rowSums(cbind(m3$TOTAL_MEDICARE_PREVENT_CHARGES_PER1, m3$TOTAL_MEDICARE_PREVENT_CHARGES_PER2), na.rm=TRUE)
df2$TOTAL_MEDICARE_PREVENT_COSTS_TOTAL    <- rowSums(cbind(m3$TOTAL_MEDICARE_PREVENT_COSTS_PER1, m3$TOTAL_MEDICARE_PREVENT_COSTS_PER2), na.rm=TRUE)
df2$TOTAL_MEDICARE_NONPREVENT_COSTS_TOTAL  <- rowSums(cbind(m3$TOTAL_MEDICARE_NONPREVENT_COSTS_PER1, m3$TOTAL_MEDICARE_NONPREVENT_COSTS_PER2), na.rm=TRUE)
df2$NET_MEDICARE_COST_TOTAL                <- rowSums(cbind(m3$NET_MEDICARE_COST_PER1, m3$NET_MEDICARE_COST_PER2), na.rm=TRUE)
df2$BENEF_COINSUR_TOTAL                 <- rowSums(cbind(m3$BENEF_COINSUR_PER1, m3$BENEF_COINSUR_PER2), na.rm=TRUE)

df2 <- cbind(df2, m3[,c(43:52)])




ret <- rbind(df, df2)




