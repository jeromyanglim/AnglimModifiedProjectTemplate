# I have a few default data files in xls format. 
# This function mimics the behaviour of the default ProjectTemplate import
# procedure. However, it uses the readxl package. 
# This has the advantage that it does not require a perl installation.
# In particular, users on Windows often lack a perl installation, and I've found it 
# to be another obstacle to getting started with ProjectTemplate.

xls.reader <- function(data.file, filename, workbook.name)
{
     ProjectTemplate:::.require.package('readxl')
     
     sheets <- readxl::excel_sheets(filename)
     
     # sheet.name <- sheets[1]
     for (sheet.name in sheets) {
         variable.name <- paste(workbook.name, ProjectTemplate:::clean.variable.name(sheet.name), 
                                sep = ".")
         tryCatch(assign(variable.name,
                         readxl::read_excel(filename,
                                         sheet = sheet.name),
                         envir = ProjectTemplate:::.TargetEnv),
                  error = function(e)
                  {
                      warning(paste("The worksheet", sheet.name, "didn't load correctly."))
                  })
     }
}

if (file.exists("data/input.xls")) xls.reader(data.file = "input.xls", filename = "data/input.xls", "input")
if (file.exists("data/meta.xls")) xls.reader(data.file = "meta.xls", filename = "data/meta.xls", "meta")

