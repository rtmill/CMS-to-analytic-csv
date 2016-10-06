# Script to merge A w/ M1
# --- Assumes you have tables a and m1 already loaded



names(a)

# 58- start STAFF_OTHER1_x
a2 <- a[,1:57]

# Combine other1, other2 and other3 to match Other_total

# columns 58-81 : other1, 2, 3
tmp <- a[,c(1,58:81)]

# Get names of aggregate columns from m1
ret <- m1[0,60:66]

# Combine 
tmp$STAFF_OTHER_COMP <-  rowSums(cbind(tmp$STAFF_OTHER1_COMP, tmp$STAFF_OTHER2_COMP, tmp$STAFF_OTHER3_COMP), na.rm=TRUE)
tmp$STAFF_OTHER_OTHER <- rowSums(cbind(tmp$STAFF_OTHER1_OTHER, tmp$STAFF_OTHER2_OTHER, tmp$STAFF_OTHER3_OTHER), na.rm=TRUE)
tmp$STAFF_OTHER_TOTAL <- rowSums(cbind(tmp$STAFF_OTHER1_TOTAL, tmp$STAFF_OTHER2_TOTAL, tmp$STAFF_OTHER3_TOTAL), na.rm=TRUE)
tmp$STAFF_OTHER_RECLASS <- rowSums(cbind(tmp$STAFF_OTHER1_RECLASS, tmp$STAFF_OTHER2_RECLASS, tmp$STAFF_OTHER3_RECLASS), na.rm=TRUE)
tmp$STAFF_OTHER_RECLASS_BAL <- rowSums(cbind(tmp$STAFF_OTHER1_RECLASS_BAL, tmp$STAFF_OTHER2_RECLASS_BAL, tmp$STAFF_OTHER3_RECLASS_BAL), na.rm=TRUE)
tmp$STAFF_OTHER_ADJUST <- rowSums(cbind(tmp$STAFF_OTHER1_ADJUST, tmp$STAFF_OTHER2_ADJUST, tmp$STAFF_OTHER3_ADJUST), na.rm=TRUE)
tmp$STAFF_OTHER_NET <- rowSums(cbind(tmp$STAFF_OTHER1_NET, tmp$STAFF_OTHER2_NET, tmp$STAFF_OTHER3_NET), na.rm=TRUE)

# Merge into building set
a2 <- cbind(a2, tmp[,26:32])



# A: Phys serv UA :  89 - Allowable GME : 151
a2 <- cbind(a2, a[,82:151])


# Test if columns match up
p <- data.frame(rbind(a2, m1[,c(1,4:136)]))
# Success!
  

# Other costs : 152-175
tmp <- a[,152:175]

# Combine
tmp$OTHERCOSTS_OTHER1_COMP <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_COMP,tmp$OTHERCOSTS_OTHER2_COMP,tmp$OTHERCOSTS_OTHER3_COMP), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_OTHER <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_OTHER,tmp$OTHERCOSTS_OTHER2_OTHER,tmp$OTHERCOSTS_OTHER3_OTHER), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_TOTAL <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_TOTAL,tmp$OTHERCOSTS_OTHER2_TOTAL,tmp$OTHERCOSTS_OTHER3_TOTAL), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_RECLASS <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_RECLASS,tmp$OTHERCOSTS_OTHER2_RECLASS,tmp$OTHERCOSTS_OTHER3_RECLASS), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_BAL <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_BAL,tmp$OTHERCOSTS_OTHER2_BAL,tmp$OTHERCOSTS_OTHER3_BAL), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_ADJUST <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_ADJUST,tmp$OTHERCOSTS_OTHER2_ADJUST,tmp$OTHERCOSTS_OTHER3_ADJUST), na.rm=TRUE)
tmp$OTHERCOSTS_OTHER1_NET  <- rowSums(cbind(tmp$OTHERCOSTS_OTHER1_NET,tmp$OTHERCOSTS_OTHER2_NET,tmp$OTHERCOSTS_OTHER3_NET), na.rm=TRUE)

# Merge into building set
a2 <- cbind(a2, tmp[,2:8])

# Total Othercosts (176) - Total cost services net (189)
a2 <- cbind(a2, a[,176:189])

# Total facility costs (270- 276) 
a2 <- cbind(a2, a[,270:276])

# Total admins costs (357) - NAGMEPTC (398)
a2 <- cbind(a2, a[,357:398])

# Non-RHC other(400-422)
tmp <- a[,400:422]

# Combine
tmp$NONRHC_OTHER1_COMP <- rowSums(cbind(tmp$NONRHC_OTHER1_COMP,tmp$NONRHC_OTHER2_COMP,tmp$NONRHC_OTHER2_COMP), na.rm=TRUE)
tmp$NONRHC_OTHER1_OTHER <- rowSums(cbind(tmp$NONRHC_OTHER1_OTHER,tmp$NONRHC_OTHER2_OTHER,tmp$NONRHC_OTHER2_OTHER), na.rm=TRUE)
tmp$NONRHC_OTHER1_TOTAL <- rowSums(cbind(tmp$NONRHC_OTHER1_TOTAL,tmp$NONRHC_OTHER2_TOTAL,tmp$NONRHC_OTHER2_TOTAL), na.rm=TRUE)
tmp$NONRHC_OTHER1_RECLASS <- rowSums(cbind(tmp$NONRHC_OTHER1_RECLASS,tmp$NONRHC_OTHER2_RECLASS,tmp$NONRHC_OTHER2_RECLASS), na.rm=TRUE)
tmp$NONRHC_OTHER1_BAL <- rowSums(cbind(tmp$NONRHC_OTHER1_BAL,tmp$NONRHC_OTHER2_BAL,tmp$NONRHC_OTHER2_BAL), na.rm=TRUE)
tmp$NONRHC_OTHER1_ADJUST <- rowSums(cbind(tmp$NONRHC_OTHER1_ADJUST,tmp$NONRHC_OTHER2_ADJUST,tmp$NONRHC_OTHER2_ADJUST), na.rm=TRUE)
tmp$NONRHC_OTHER1_NET <- rowSums(cbind(tmp$NONRHC_OTHER1_NET,tmp$NONRHC_OTHER2_NET,tmp$NONRHC_OTHER2_NET), na.rm=TRUE)

# Merge
a2 <- cbind(a2, tmp[,1:7])

# Total Non-reimburs (454)- Total costs (466)
a2 <- cbind(a2, a[,454:466])

# Test if columns match up
p <- data.frame(names(a2), names(m1[,c(1,4:226)]))
# NOPE. TOTAL_COSTS_RECLASS part of m1 but not a

# Remove total_costs_reclass column ( not shared )
m1 <- m1[,-224]

# Test if columns match up
p <- data.frame(rbind(a2, m1[,c(1,4:226)]))
# Yep. 


#------

# ADD SOURCE INFORMATION

# Add record type and subprovider. 
# Subprovider does not apply here, set to 0 
a3 <- data.frame(a2$RPT_REC_NUM)
names(a3)[1] <- "RPT_REC_NUM"
a3$TYPE <- "INDEPENDENT"
a3$SUBPROVIDER <- 0
a3 <- cbind(a3, a2[,2:ncol(a2)])

m1a <- data.frame(m1$RPT_REC_NUM)
names(m1a)[1] <- "RPT_REC_NUM"
m1a$TYPE <- "PROVIDER"
m1a <- cbind(m1a, m1[,3:ncol(m1)])


# Final combine (fingers crossed)
ret <- rbind(a3, m1a)
# Success!






