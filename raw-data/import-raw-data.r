# Place raw data in this folder
# Use this r-scrip file to do any preliminary processing of raw data files in preparation for
# exporting to the "data" folder.
#
# Common data manipualtions at this stage
# 1. Changing file names to something more suitable: (e.g., "my-very-longfilename.csv" 
#    to "rcases.csv"); Note that ProjectTemplate will generally name a data.frame according to 
#    the characters prior to file extension (e.g., rcases.csv becomes the data.frame rcases)
# 2. Anonymising data. In some cases, the aim is to compare the entire project including code 
#    and data. In this case, some data files include identifying variables (e.g., date of birth,
#    address, name, and so on). Thus, it is useful to 
# 3. Adding an ID variable. 
# 4. Fix up variable names: While this can go in the main munge file, it can also be nice if the
#    data file in the data directory roughly corresponds to your actual data file.
#    Making file names lower case is particularly useful as it removes the need to think about case:
#    names(df) <- tolower(names(df))
#    It can also be an opportunity to make variable names more consistent
# 5. Remove unnecessary variables. 


# Start of script
# Useful first command to load included packages and set options, 
# but usually you don't want munging or data loading
# at this stage:
# rm(list = ls())
library(ProjectTemplate); load.project(list(munging=FALSE, data_loading = FALSE))
