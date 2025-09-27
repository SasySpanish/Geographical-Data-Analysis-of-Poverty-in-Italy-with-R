# 04_spatial_tests.R

library(spdep)

# Moran’s I
moran_res <- moran.test(poverta$Rischiopoverta, listw, zero.policy=TRUE)
capture.output(moran_res, file="results/tests/moran.txt")

# Moran scatterplot
png("results/plots/moran_scatterplot.png", width=800, height=600)
moran.plot(scale(poverta$Rischiopoverta), listw, zero.policy=TRUE, pch=20, col="blue")
dev.off()

# Geary’s C
geary_res <- geary.test(poverta$Rischiopoverta, listw, zero.policy=TRUE)
capture.output(geary_res, file="results/tests/geary.txt")

# Local Moran (LISA)
LISA <- localmoran(poverta$Rischiopoverta, listw, zero.policy=TRUE)
write.csv(LISA, "results/tests/LISA.csv")

sessionInfo()
