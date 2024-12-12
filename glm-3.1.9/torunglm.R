rm(list=ls())

# Load libraries
library(glmtools)
library(rLakeAnalyzer)
setwd("C:/Users/ASUS/Desktop/UoE/Dissertation/dissertation/glm-3.1.9")

# Install and run glmGUI
#devtools::install_github("jackpmcd/glmgui")
glmgui::glmGUI()

run_glm()
