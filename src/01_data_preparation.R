# 01_data_preparation.R

# Load libraries
library(sf)
library(dplyr)
library(mapview)

# Load shapefile (NUTS2 regions of Italy)
P <- st_read(dsn = "nuts2.shp", layer = "NUTS2")

# Load poverty dataset
poverta <- read.csv("poverta.csv")

# Rename problematic columns
names(poverta) <- iconv(names(poverta), from="UTF-8", to="ASCII//TRANSLIT")
names(poverta) <- make.names(names(poverta))

# Merge shapefile with poverty dataset
x <- merge(P, poverta, by.x = "NUTS2", by.y = "NUTS2")

# Quick map visualization
mapview(x)

# Explore poverty dataset
str(poverta)
summary(poverta)

# Save merged data
st_write(x, "results/merged_poverty.geojson", delete_dsn = TRUE)

sessionInfo()
