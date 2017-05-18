# Script to merge S-1 with s8 & S2
#----  assumes you have tables s1, s3 and s8 already loaded


# Add source information 
# s1
df <- data.frame(s1[,1])
names(df)[1] <- "RPT_REC_NUM"
df$TYPE <- "INDEPENDENT"
df$SUBPROVIDER <- 0
df <- cbind(df, s1[,c(2:27,43)])

# s8 
df2 <- data.frame(s8[,1])
names(df2)[1] <- "RPT_REC_NUM"
df2$TYPE <- "PROVIDER"
df2 <- cbind(df2, s8[,3:ncol(s8)])

# s3
df3 <- data.frame(s3[,1])
names(df3)[1] <- "RPT_REC_NUM"
df3$TYPE <- "INDEPENDENT"
df3 <- cbind(df3, s3[,c(3:29,44)])


ret <- rbind(df, df2, df3)
