# AnglimModifiedProjectTemplate (v 0.5)

ProjectTemplate is an R Package which facilitates data analysis with R. It makes it easy to start a new data analysis project. In short, **ProjectTemplate is awesome and worth learning**.

I have modified the default ProjectTemplate folder structure to align more with my workflow. 
However, I think these tweaks should be useful for others.
More information is described below.


# System Requirements
* Install R https://cran.rstudio.com/
* Install Rstudio https://www.rstudio.com/products/rstudio/download3/
* Install R packages: `knitr`, `ProjectTemplate`  (e.g., `install.packages("knitr")`)
* Install any R packages required for data import or listed in `config/global.dcf`

In addition:
* Install any dependencies of these R packages. In particular, if you use xls files to store some data. You may need to install Perl: http://www.perl.org/get.html ; OSX and Linux generally come with perl installed; On Windows OS you need to install it.
* If you want to be able to knit to pdf, then get a TeX distribution (https://www.latex-project.org/get/); otherwise, just knit to Word or HTML.


# Getting Started with a New Data Analysis Project
If you want to use this workflow for doing data analysis, adopt the following steps:

* [Download a zip file of the AnglimModifiedProjectTemplate](https://github.com/jeromyanglim/AnglimModifiedProjectTemplate/archive/master.zip)
* Unzip this file in an appropriate location and give both the directory and the RStudio project file (i.e., `InsertProjectNameHere.Rproj`) a name corresponding to your project
* Open in Rstudio by clicking the `.Rproj` file (this helps to ensure that the R working directory is correct) 
* Prepare raw-data (i.e., ensure name of data file is what you want it to be in R) and add to `data` directory
* Open included RMarkdown file (i.e., `explore.rmd`) and run the chunk `library(ProjectTemplate); load.project()` and check that the data imported correctly (you may well get errors at this point indicating that you need to install additional R packages or dependencies (particularly perl with gdata), if so, install these).

You're now ready to start manipulating and analysing your data.

* **Data manipulation:** If you need to modify your imported data, put this code in an r-script in the munge directory (i.e., `munge/01-munge.R`). E.g., add or modify a variables in a data.frame; add or remove cases; merge data frames. More generally, if there are any objects that need to be accessible across multiple analyses, then put them in the munge script.
* **Additional R Packages:** If you need to use an additional R package, add the name of this package to the `libraries` line in `config/global.dcf` rather than adding `library("packagename")` to your script.
* **Custom functions:** If you write a function to help you perform your analyses, then place it in an r script in the `lib` directory. This way it will be automatically imported everytime you run `load.project()`
* **Data analysis**: If you are running analyses that you plan to keep, then place them in an an RMarkdown file (e.g., `explore.rmd`). Make sure that the you have an initial chunk that just has `library(ProjecTemplate); load.project()`. Then add code chunks after that as required. 


# Debugging and General Tips
* **What if data does not import correctly?** In some cases, the default data import rules used by ProjectTemplate do not work as you might want. In that case, you can add your own code to import the data. Place this code in an R script in the `lib` directory (e.g., `data-import-override.r`). If the data is not importing at all, this can be a sign of several things (you don't have a package installed; you don't have a dependency like Perl or Java installed; the data has formatting issues). For more information about file formats in ProjectTemplate see http://projecttemplate.net/file_formats.html ).

* **What if there is an error in my data manipulation code (i.e., munge files)?** Clear the workspace (i.e., click the broom in Rstudio or run `rm(list=ls())`. Then run `library(ProjectTemplate); load.project(list(munging=FALSE))`. This will load the data, import packages and so on, but wont run the data manipulation code. Then run each line in the data manipulation file until you encounter the error. Then it's just a matter of adopting normal debugging procedures. Make sure the data manipulation file is saved.

* **Returning to an analysis after closing RStudio?** In general, you should just need to open Rstudio using the Rproj file and then run `library(ProjectTemplate); load.project()`. This will automatically load the data, import specified packages, import support functions, and run initial data manipulations manipulations. You should then be able to begin analysis. 

* **What if RMarkdown code chunks can not find a variable?** This is usually a sign that data manipulation steps have been placed in the RMarkdown file. Try to find these and move them into the munge folder. In general, aim for RMarkdown code chunks to only depend on `load.project()` and not on other code chunks. So in theory, after running `load.project()` you should be able to run any other chunks in any order.

* **General comments about workflow:** 
For some steps, you have the choice between refreshing the project or adopting a manual step. For example, when importing a package, you can either use `library(...)` or you can add the package to `global.dcf` and run `load.project()`. Similarly if you are creating a new function that you put in the `lib` directory, you can either source it manually or you can run `load.project()`. Either approach is fine. The key is to remember to do the steps required to ensure everything works with ProjectTemplate. A general trick for debugging, is to clear the workspace, and then run `load.project()`. In addition, when exploring the data, you often run analyses that don't need to be saved in your data analysis script.  

* **Saving figures and tables**: When conducting reproducible data analysis a writing a mansucript, you can use a document format that allows for weaving results and formatted text (e.g., RMarkdown or LaTeX using either knitr or Sweave). An alternative is to make the process of generating tables, figures, and text fully reproducible by a script, but then manually import this into your document. While weaving formats are more reproducible, they can result in practical problems. In particular, I'm tyipcally collaborating with people who use Microsoft Word. Furthermore, it can be nice to know that the figures and tables are fixed and wont accidentally change without your knowledge. And some steps like detailed table formatting, can be quite complicated to automate. If you adopt this semi-automated process, then it's useful to export the figures to the `output` directory (e.g., http://www.statmethods.net/graphs/creating.html). Tables can also be exported to the output directory (e.g., using `write.csv(mytable, file = "output/mytable.csv")` where it can have manual formatting applied (e.g., lines, centering, fonts, etc.). 


# Tutorials:
* An [general explanation on using this customised ProjectTemplate](http://jeromyanglim.blogspot.com.au/2014/05/customising-projecttemplate-in-r.html). Note that it was written with version 0.1. A few things have changed since then. 
* The general ProjectTemplate website includes more general information about [ProjectTemplate](http://projecttemplate.net) and [here is a video providing an introduction to ProjectTemplate more generally](https://www.youtube.com/watch?v=I9YNIi-QmR0)


# Video tutorials
* [General video giving overview of ProjectTemplate](https://www.youtube.com/watch?v=gjCbt1Kfge8)
* [General video on RMarkdown](https://www.youtube.com/watch?v=CH6CYI6NheI)
* [Tutorial on scoring psychological test using RMarkdown and ProjectTemplate](https://www.youtube.com/watch?v=iFFW5sK3Bhk)
* [Tutorial on confirmatory factor analyais using lavaan and ProjectTemplate](https://www.youtube.com/watch?v=gcrXP2yMYY8)


# Change log


v. 0.5.1

* added `rm(list=ls())` in various location to make it easier to reset project before running
  `library(ProjectTemplate); load.project()`

v. 0.5

* Moved rmd files out of reports directory (rmd files are simpler to understand when they are in the working directory, even if they do create a little clutter)
* Removed figure and doc directories as they weren't being used; the `output` directory functions as a useful general store of output
* Added this readme file to explain how projectTemplate works
* Added ggplot2 as default package in global.dcf
* Disabled saving and loading of R Workspaces in the Rstudio project file as this workflow works against the purpose of ProjectTemplate
* Added file `raw-data/import-raw-data.r` as a place holder file for preparing initial data files
* Created a change log and version information.
* Added file `lib/importxls.r`. It reads my two default xls files in the data directory using the `readxl` package rather than `gdata`. `readxl` has the advantage that it does not have an external dependency on perl.


v. 0.4 

* Added `raw-data` directory as a standardised location for converting raw data into data suitable for the data directory (i.e., convert original file names to those suitable for data directory; 
* Updated `config/global.dcf` to reflect updates to ProjectTemplate (v 0.6)


v. 0.1
* Modified default global.dcf (`as_factors: off` and changd default packages)
* Made readme.md blank
* Removed a couple of directories  (e.g., diagnositics, logs, profiling)
* Added an initial Rmarkdown file in the reports directory
* Added RStudio project file (i.e., .Rproj) to enable easy launching of RStudio.
* Created output directory as the general location for saving all output (figures, tables, data files). This name seemed more appropriate than the built-in "graphs" diretory.
* Added `output/output-processing.xlsx` for manually preparing tables from exported data
* Added `data/meta.xls` as general file for storing meta data (e.g., scoring rules for psychological tests)
* Added `data/input.xls` a simple general purpose spreadsheet for storing ad hoc data that needs to be imported into R
