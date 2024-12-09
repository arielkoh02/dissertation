# install.packages("devtools")
##devtools::install_github("GLEON/GLM3r")
##devtools::install_github("USGS-R/glmtools")
writeLines('PATH="C:/ProgramData/Microsoft/Windows/Start Menu/Programs/Rtools 4.4;${PATH}"', con = "~/.Renviron")
system('g++ --version')


install.packages("C:/Users/ASUS/Desktop/UoE/Dissertation/glm-3.1.9/glmgui_1.0.tar.gz", repos = NULL, type = "source",dependencies = TRUE)

rm(list=ls())

# Load libraries
library(glmtools)
library(rLakeAnalyzer)
library(glmGUI)
GLM3r::GLMgui()
setwd("C:/Users/ASUS/Desktop/UoE/Dissertation/glm-3.1.9")

# Install and run glmGUI
#devtools::install_github("jackpmcd/glmgui")
glmgui::glmGUI()


run_glm()


