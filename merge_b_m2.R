# script to merge b w/ m2
# --- Assumes you have tables b and m2 loaded


# Add source information
# b
df <- data.frame(b[,1])
names(df)[1] <- "RPT_REC_NUM"
df$TYPE <- "INDEPENDENT"
df$SUBPROVIDER <- 0
df <- cbind(df, b[,2:ncol(b)])

#m2
df2 <- data.frame(m2[,1])
names(df2)[1] <- "RPT_REC_NUM"
df2$TYPE <- "PROVIDER"
df2 <- cbind(df2, m2[,3:ncol(m2)])

ret <- rbind(df, df2)
