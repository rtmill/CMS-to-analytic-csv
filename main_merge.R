# higher level script to run the individual merging scripts 


# ----  stats  -----
#2011
s1 <- read.csv("C:/Users/b/Desktop/RHC/2011/ws_mapped.csv", stringsAsFactors = FALSE)
s3 <- read.csv("C:/Users/b/Desktop/RHC/2011/ws3_mapped.csv", stringsAsFactors = FALSE)
s8 <- read.csv("C:/Users/b/Desktop/RHC/2011/ws8_2552_mapped.csv", stringsAsFactors = FALSE)
source('merge_s1_s8s2.R')
write.csv(ret, "Combined/stats_2011.csv", row.names=FALSE)
#2012
s1 <- read.csv("C:/Users/b/Desktop/RHC/2012/ws_mapped.csv", stringsAsFactors = FALSE)
s3 <- read.csv("C:/Users/b/Desktop/RHC/2012/ws3_mapped.csv", stringsAsFactors = FALSE)
s8 <- read.csv("C:/Users/b/Desktop/RHC/2012/ws8_2552_mapped.csv", stringsAsFactors = FALSE)
source('merge_s1_s8s2.R')
write.csv(ret, "Combined/stats_2012.csv", row.names=FALSE)
#2013
s1 <- read.csv("C:/Users/b/Desktop/RHC/2013/ws_mapped.csv", stringsAsFactors = FALSE)
s3 <- read.csv("C:/Users/b/Desktop/RHC/2013/ws3_mapped.csv", stringsAsFactors = FALSE)
s8 <- read.csv("C:/Users/b/Desktop/RHC/2013/ws8_2552_mapped.csv", stringsAsFactors = FALSE)
source('merge_s1_s8s2.R')
write.csv(ret, "Combined/stats_2013.csv", row.names=FALSE)
#2014
s1 <- read.csv("C:/Users/b/Desktop/RHC/2014/ws_mapped.csv", stringsAsFactors = FALSE)
s3 <- read.csv("C:/Users/b/Desktop/RHC/2014/ws3_mapped.csv", stringsAsFactors = FALSE)
s8 <- read.csv("C:/Users/b/Desktop/RHC/2014/ws8_2552_mapped.csv", stringsAsFactors = FALSE)
source('merge_s1_s8s2.R')
write.csv(ret, "Combined/stats_2014.csv", row.names=FALSE)

rm(list=ls())


# ------- costs ------- 
# 2011
a <- read.csv("C:/Users/b/Desktop/RHC/2011/wa_mapped.csv")
m1 <- read.csv("C:/Users/b/Desktop/RHC/2011/wm1_2552_mapped.csv")
source('merge_a_m1.R')
write.csv(ret, "Combined/costs_2011.csv", row.names=FALSE)
# 2012
a <- read.csv("C:/Users/b/Desktop/RHC/2012/wa_mapped.csv")
m1 <- read.csv("C:/Users/b/Desktop/RHC/2012/wm1_2552_mapped.csv")
source('merge_a_m1.R')
write.csv(ret, "Combined/costs_2012.csv", row.names=FALSE)
# 2013
a <- read.csv("C:/Users/b/Desktop/RHC/2013/wa_mapped.csv")
m1 <- read.csv("C:/Users/b/Desktop/RHC/2013/wm1_2552_mapped.csv")
source('merge_a_m1.R')
write.csv(ret, "Combined/costs_2013.csv", row.names=FALSE)
# 2014
a <- read.csv("C:/Users/b/Desktop/RHC/2014/wa_mapped.csv")
m1 <- read.csv("C:/Users/b/Desktop/RHC/2014/wm1_2552_mapped.csv")
source('merge_a_m1.R')
write.csv(ret, "Combined/costs_2014.csv", row.names=FALSE)

rm(list=ls())

# ------ visits ------ 
# TODO: Remove this and bring to higher level
# 2011
b <- read.csv("C:/Users/b/Desktop/RHC/2011/wb_mapped.csv")
m2 <- read.csv("C:/Users/b/Desktop/RHC/2011/wm2_2552_mapped.csv")
source('merge_b_m2.R')
write.csv(ret, "Combined/visits_2011.csv", row.names= FALSE)
# 2012
b <- read.csv("C:/Users/b/Desktop/RHC/2012/wb_mapped.csv")
m2 <- read.csv("C:/Users/b/Desktop/RHC/2012/wm2_2552_mapped.csv")
source('merge_b_m2.R')
write.csv(ret, "Combined/visits_2012.csv", row.names= FALSE)
# 2013
b <- read.csv("C:/Users/b/Desktop/RHC/2013/wb_mapped.csv")
m2 <- read.csv("C:/Users/b/Desktop/RHC/2013/wm2_2552_mapped.csv")
source('merge_b_m2.R')
write.csv(ret, "Combined/visits_2013.csv", row.names= FALSE)
# 2014
b <- read.csv("C:/Users/b/Desktop/RHC/2014/wb_mapped.csv")
m2 <- read.csv("C:/Users/b/Desktop/RHC/2014/wm2_2552_mapped.csv")
source('merge_b_m2.R')
write.csv(ret, "Combined/visits_2014.csv", row.names= FALSE)


rm(list=ls())



# ---- payment ----        // Should there be another names for this?
# TODO: Remove this
# 2011
c <- read.csv("C:/Users/b/Desktop/RHC/2011/wc_mapped.csv")
m3 <- read.csv("C:/Users/b/Desktop/RHC/2011/wm3_2552_mapped.csv")
source('merge_c_m3.R')
write.csv(ret, "Combined/payments_2011.csv", row.names=FALSE)
# 2012
c <- read.csv("C:/Users/b/Desktop/RHC/2012/wc_mapped.csv")
m3 <- read.csv("C:/Users/b/Desktop/RHC/2012/wm3_2552_mapped.csv")
source('merge_c_m3.R')
write.csv(ret, "Combined/payments_2012.csv", row.names=FALSE)
# 2013
c <- read.csv("C:/Users/b/Desktop/RHC/2013/wc_mapped.csv")
m3 <- read.csv("C:/Users/b/Desktop/RHC/2013/wm3_2552_mapped.csv")
source('merge_c_m3.R')
write.csv(ret, "Combined/payments_2013.csv", row.names=FALSE)
# 2014
c <- read.csv("C:/Users/b/Desktop/RHC/2014/wc_mapped.csv")
m3 <- read.csv("C:/Users/b/Desktop/RHC/2014/wm3_2552_mapped.csv")
source('merge_c_m3.R')
write.csv(ret, "Combined/payments_2014.csv", row.names=FALSE)


rm(list=ls())
