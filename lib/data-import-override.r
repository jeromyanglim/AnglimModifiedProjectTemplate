# Add alternative data importation commands for files in 
# the data folder that should not be imported using standard data importation rules


# Sometime around version 0.8.2, tibble conversion was made compulsory;
# but this was corrected in version 0.9.0
# disable tibble conversion

# try({.convert.to.tibble <- function (data.sets)  NULL;
#     assignInNamespace(".convert.to.tibble", .convert.to.tibble, 
#                   "ProjectTemplate")})
