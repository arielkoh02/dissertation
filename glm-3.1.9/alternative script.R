#alternative
setwd(sim_folder)

sim_folder <- system.file('extdata', package = 'GLM3r')
View(sim_folder)
run_glm(sim_folder)
list.files(sim_folder)

nml<-read_nml('glm3.nml')
nml

glm_version()

file.copy('glm3.nml', 'glm3_modified.nml')

# Read the new glm_modified.nml file
nml3_modified <- read_nml('glm3_modified.nml')

# Modify parameters
nml3_modified <- set_nml(nml3_modified, 'start', '2024-01-01 00:00:00')
nml3_modified <- set_nml(nml3_modified, 'stop', '2024-12-31 23:59:59')
nml3_modified <- set_nml(nml3_modified, 'lake_depth', 60)

# Write the modified nml to a new file
write_nml(nml3_modified, 'glm_modified.nml')

# You can now run the simulation using the new configuration file
run_glm("glm_modified.nml")