# Script to test config usage

source("config.R")


dir.create(dest_dir, showWarnings = FALSE)

if(write_before_merge){
  dir.create(mapped_dir, showWarnings= FALSE)
}

for(i in 1:length(year_list)){
  year <- year_list[i]
  print(year)
  source("SINGLE_YEAR.R")
}

