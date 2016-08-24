# AnglimModifiedProjectTemplate
# Version 0.5


# System Requirements
* Install R https://cran.rstudio.com/
* Install Rstudio https://www.rstudio.com/products/rstudio/download3/
* Install R packages: `knitr`, `ProjectTemplate`  (e.g., `install.packages("knitr")`)
* Install any R packages required for data import or listed in `config/global.dcf`
* Install any dependencies of these R packages. In particular, I use xls files to store some data, which requires a Perl installation http://www.perl.org/get.html ; OSX and Linux generally come with perl installed; On Windows OS you need to install it (or just remove the two xls files from the data directory).
* If you want to be able to knit to pdf, then get a TeX distribution (https://www.latex-project.org/get/); otherwise, just knit to Word or HTML.


# Getting Started with a Project using AnglimModifiedProjectTemplate
* [Download a zip file of the AnglimModifiedProjectTemplate](https://github.com/jeromyanglim/AnglimModifiedProjectTemplate/archive/master.zip)
* Unzip this file in an appropriate location and give both the directory and the RStudio project file (i.e., `InsertProjectNameHere.Rproj`) a name corresponding to your project
* Open in Rstudio by clicking the `.Rproj` file (this helps to ensure that the R working directory is correct) 
* Prepare raw-data (i.e., ensure name of data file is what you want it to be in R) and add to `data` directory
* Open included RMarkdown file (i.e., `explore.rmd`) and run the chunk `library(ProjectTemplate); load.project()` and check that the data imported correctly (you may well get errors at this point indicating that you need to install additional R packages or dependencies (particularly perl with gdata), if so, install these).

You're now ready to start manipulating and analysing your data.

* **Data manipulation:** If you need to modify your imported data, put this code in an r-script in the munge directory (i.e., `munge/01-mungge.R`). i.e., add or modify a variable in a data.frame; add or remove cases; merge data frames. More generally, if there are any objects that need to be accessible across multiple analyses, then put them in the munge script.
* **Additional R Packages:** If you need to use an additional R package, add the name of this package to the `libraries` line in `config/global.dcf` rather than adding `library("packagename")` to your script.
* **Custom functions:** If you write a function to help you perform your analyses, then place it in an r script in the `lib` directory. This way it will be automatically imported everytime you run `load.project()`
* **Data analysis**: If you are running analyses that you plan to keep, then place them in an an RMarkdown file (e.g., `explore.rmd`). Make sure that the you have a separate chunk before you analyses that just has `library(ProjecTemplate); load.project()`. Then add code chunks as required. 


# Debugging and General Tips
* What if the data does not import correctly? In some cases, the default data import rules used by ProjectTemplate do not work as you might want. In that case, you can add your own code to import the data. Place this code in an R script in the `lib` directory (e.g., `data-import-override.r`).

* What if there is an error in my data manipulation code (i.e., munge files)? Clear the workspace (i.e., click the broom in Rstudio or run `rm(list=ls())`. Then run `library(ProjectTemplate); load.project(list(munging=FALSE))`. This will load the data, import packages and so on, but wont run the data manipulation code. Then run each line in the data manipulation file until you encounter the error. Then it's just a matter of adopting normal debugging procedures.

* Returning to an analysis after closing RStudio? In general, you should just need to open Rstudio using the Rproj file and then run `library(ProjectTemplate); load.project()`. You should then be able to begin analysis.

* What if RMarkdown code chunks can not find a variable? This is usually a sign that data manipulation steps have been place in the RMarkdown file. Try to find these and move them into the munge folder. In general, a good aim is for RMarkdown code chunks should only depend on `load.project()` but not on other code chunks. So in theory, after running `load.project()` you should be able to run any other chunks in any order.


# Tutorials:
* An general explanation on using this customised ProjectTemplate](http://jeromyanglim.blogspot.com.au/2014/05/customising-projecttemplate-in-r.html)


# Video tutorials
* [General video giving overview of ProjectTemplate](https://www.youtube.com/watch?v=gjCbt1Kfge8)
* [General video on RMarkdown](https://www.youtube.com/watch?v=CH6CYI6NheI)
* [Tutorial on scoring psychological test using RMarkdown and ProjectTemplate](https://www.youtube.com/watch?v=iFFW5sK3Bhk)
* [Tutorial on confirmatory factor analyais using lavaan and ProjectTemplate](https://www.youtube.com/watch?v=gcrXP2yMYY8)


# Change log

v. 0.5

* Moved rmd files out of reports directory (rmd files are simpler to understand when they are in the working directory, even if they do create a little clutter)
* Removed figure and doc directories as they weren't being used; the `output` directory functions as a useful general store of output
* Added this readme file to explain how projectTemplate works
* Added ggplot2 as default package in global.dcf
* Disabled saving and loading of R Workspaces in the Rstudio project file as this workflow works against the purpose of ProjectTemplate

v. 0.4 

* Add raw-data directory as a standardised location for converting raw data into data suitable for the data directory (i.e., convert original file names to those suitable for data directory; 
* Updated `config/global.dcf` to reflect updates to ProjectTemplate


v. 0.1
* Modified default global.dcf (`as_factors: off` and changd default packages)
* Made readme.md blank
* Removed a couple of directories  (e.g., diagnositics, logs, profiling)
* An initial rmd file  in the reports directory
* An .Rproj RStudio project file to enable easy launching of RStudio.
* Created output directory as the general location for saving all output (figures, tables, data files). This name seemed more appropriate than the built-in "graphs" diretory.
