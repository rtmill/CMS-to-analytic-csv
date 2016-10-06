This folder contains an ETL from CMS-222-92 and CMS-2552-10 to analytic csv files. Not all of the source variables were mapped, only a specified subset. 

To combat the memory limitations of working with files this large in R, the overall design of this project focused heavily on modularity. This was beneficial in several ways.
-Allows opportunities to clear the memory periodically throughout the code 
-Eliminates need for multiple large data sets loaded at the same time
-Making adjustments and debugging are much more intuitive and accessible

Conventions
-Match between files of the same year by joining on RPT_REC_NUM and SUBPROVIDER 
-If subprovider or title is not applicable they are set to 0 by default 
-The combined files contain only the intersecting variables of the corresponding worksheets. 
	The variables distinct to the tables before merge are retained in the initial mapping files ( eg. 2011/w3_mapped.csv)
-For independent RHCs filing under consolidated ( Worksheet S3 of CMS-222-92 ) the data for the columns "TYPE_OF_CONTROL" and "TYPE_OF_PROVIDER" are not provided
	They are represented as NA in the merged files
-"Provider Number" and "CCN" are considered to be equivalent



Folder Structure 
---------------
2011-2014    : Mapped files for each worksheet (not combined)
Combined     : Final product. Combination of Independent and Provider worksheets. *** WHAT SHOULD BE USED FOR ANALYSIS 
HCLINIC/HOSP : Original files/ documentation
temp         : Mappings from original (ALPHA, NMRC, RPT) tables to usable format
