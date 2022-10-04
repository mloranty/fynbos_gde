######################################
# script to analyze planet MS data
# for Steenbras Dam burned study site
#
#
# MML 4 Oct 2022
######################################

rm(list = ls())

library(terra)

### set working directory ###
setwd("/Volumes/GoogleDrive/My Drive/Documents/research/fynbos_gde/steenbras/")

# list harmonized planet 8 bands files
f <- list.files(pattern = "8b_harmonized", recursive = T,full.names = T)

# read in planet images
r <- rast(f[1])
r2 <- rast(f[2])
r3 <- rast(f[3])

# read in fire perimeter data set
p <- vect("All_Fires_21_22_gw_BGIS/All_Fires_21_22_gw.shp")

# select perimeter for fire of interest at Steenbras
st <- p[which(p$ID == 1868),]

# project perimeter to match RS
st <- project(st,r)

#NDRE = (NIR – RED EDGE) / (NIR + RED EDGE)

n <- (r[[8]]-r[[7]])/(r[[8]]+r[[7]])
n2 <- (r2[[8]]-r2[[7]])/(r2[[8]]+r2[[7]])
n3 <- (r3[[8]]-r3[[7]])/(r3[[8]]+r3[[7]])



