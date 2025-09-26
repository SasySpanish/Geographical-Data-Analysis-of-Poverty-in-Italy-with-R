# 03_spatial_weights.R

library(spdep)

# Queen contiguity
list.queen <- poly2nb(x, queen=TRUE)
listw <- nb2listw(list.queen, style="W", zero.policy=TRUE)

# Save weights
saveRDS(listw, "results/weights/listw_queen.rds")

# Visualization
coords <- st_centroid(st_geometry(x), of_largest_polygon=TRUE)
png("results/plots/queen_weights.png", width=800, height=600)
plot(st_geometry(x), col="darkgrey")
plot(list.queen, coords=coords, col="blue", lwd=2, add=TRUE)
dev.off()

sessionInfo()
