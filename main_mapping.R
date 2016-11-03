# Main mapping script



# ---------   Form:  CMS-222-92    -------------


# Run script to create folder of working files
# -------------------------------------------
source('CREATE_WORKING_FILES.R')



rm(list=ls())


# Import working file and call mapping scripts for 2011
#------------------------------
both <- read.csv("temp/both2011.csv")

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, "2011/wc_mapped.csv",row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, "2011/wb_mapped.csv",row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, "2011/wa_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, parts I & II
source('PARSE_S.R')
write.csv(build, "2011/ws_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, "2011/ws3_mapped.csv",row.names=FALSE )


# Import working file and call mapping scripts for 2012
#------------------------------
both <- read.csv("temp/both2012.csv")

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, "2012/wc_mapped.csv",row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, "2012/wb_mapped.csv",row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, "2012/wa_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, parts I, II
source('PARSE_S.R')
write.csv(build, "2012/ws_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, "2012/ws3_mapped.csv",row.names=FALSE )




# Import working file and call mapping scripts for 2013
#------------------------------
both <- read.csv("temp/both2013.csv")

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, "2013/wc_mapped.csv",row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, "2013/wb_mapped.csv",row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, "2013/wa_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, parts I, II
source('PARSE_S.R')
write.csv(build, "2013/ws_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, "2013/ws3_mapped.csv",row.names=FALSE )



# Import working file and call mapping scripts for 2014
#------------------------------------------------------
both <- read.csv("temp/both2014.csv")

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, "2014/wc_mapped.csv",row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, "2014/wb_mapped.csv",row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, "2014/wa_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, parts I, II
source('PARSE_S.R')
write.csv(build, "2014/ws_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, "2014/ws3_mapped.csv",row.names=FALSE )



# Import working file and call mapping scripts for 2015
#------------------------------------------------------
both <- read.csv("temp/both2015.csv")

# Run script to map worksheet c parts I & II
source('PARSE_C.R')
write.csv(build, "2015/wc_mapped.csv",row.names=FALSE )

# Run script to map worksheet b
source('PARSE_B.R')
write.csv(build, "2015/wb_mapped.csv",row.names=FALSE )

# Run script to map worksheet a, parts I & II
source('PARSE_A.R')
write.csv(build, "2015/wa_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, parts I, II
source('PARSE_S.R')
write.csv(build, "2015/ws_mapped.csv",row.names=FALSE )

# Run script to map worksheet s, part III
source('PARSE_S32.R')
write.csv(temp, "2015/ws3_mapped.csv",row.names=FALSE )




rm(list=ls())


#-------------- Form : CMS-2552-10 -----------------------------





#-------- Create working files -----------
source('CREATE_WORKING_FILES_2552.R')



rm(list=ls())

#----------- Run scripts using working files to map into .csv files ---

#-----
# S8 -
#-----


# 2011
s8 <- read.csv("temp/s8_2011.CSV")
source('PARSE_2552_S8.R')
s2 <- read.csv("temp/s2_2011.csv")
source('PARSE_2552_S2.R')
write.csv(temp, "2011/ws8_2552_mapped.csv", row.names = FALSE)

#2012
s8 <- read.csv("temp/s8_2012.csv")
source('PARSE_2552_S8.R')
s2 <- read.csv("temp/s2_2012.csv")
source('PARSE_2552_S2.R')
write.csv(temp, "2012/ws8_2552_mapped.csv", row.names = FALSE)

#2013
s8 <- read.csv("temp/s8_2013.csv")
source('PARSE_2552_S8.R')
s2 <- read.csv("temp/s2_2013.csv")
source('PARSE_2552_S2.R')
write.csv(temp, "2013/ws8_2552_mapped.csv", row.names = FALSE)

#2014
s8 <- read.csv("temp/s8_2014.csv")
source('PARSE_2552_S8.R')
s2 <- read.csv("temp/s2_2014.csv")
source('PARSE_2552_S2.R')
write.csv(temp, "2014/ws8_2552_mapped.csv", row.names = FALSE)

#2015
s8 <- read.csv("temp/s8_2015.csv")
source('PARSE_2552_S8.R')
s2 <- read.csv("temp/s2_2015.csv")
source('PARSE_2552_S2.R')
write.csv(temp, "2015/ws8_2552_mapped.csv", row.names = FALSE)



rm(list=ls())

#------
#- M -
#------


# 2011
m <- read.csv("temp/m_2011.csv")
source('PARSE_2552_M1.R')
write.csv(temp, "2011/wm1_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, "2011/wm2_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, "2011/wm3_2552_mapped.csv", row.names = FALSE)

# 2012
m <- read.csv("temp/m_2012.csv")
source('PARSE_2552_M1.R')
write.csv(temp, "2012/wm1_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, "2012/wm2_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, "2012/wm3_2552_mapped.csv", row.names = FALSE)

# 2013
m <- read.csv("temp/m_2013.csv")
source('PARSE_2552_M1.R')
write.csv(temp, "2013/wm1_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, "2013/wm2_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, "2013/wm3_2552_mapped.csv", row.names = FALSE)

# 2014
m <- read.csv("temp/m_2014.csv")
source('PARSE_2552_M1.R')
write.csv(temp, "2014/wm1_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, "2014/wm2_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, "2014/wm3_2552_mapped.csv", row.names = FALSE)


# 2015
m <- read.csv("temp/m_2015.csv")
source('PARSE_2552_M1.R')
write.csv(temp, "2015/wm1_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M2.R')
write.csv(temp, "2015/wm2_2552_mapped.csv", row.names = FALSE)
source('PARSE_2552_M3.R')
write.csv(temp, "2015/wm3_2552_mapped.csv", row.names = FALSE)

rm(list=ls())

