# 05_spatial_models.R

library(spatialreg)
library(stargazer)
library(lmtest)

# OLS baseline
stargazer(chi.ols1, type="text", out="results/models/ols_table.txt")

# LM tests
LM_tests <- lm.LMtests(chi.ols1, listw, test="all", zero.policy=TRUE)
capture.output(LM_tests, file="results/models/LM_tests.txt")

# SAR model
sar.chi <- lagsarlm(Rischio_poverta ~ Bassa_intensita_lavoro +
                      Situazione_economica_della_famiglia +
                      Partecipazione_alla_formazione_continua,
                    data = poverta, listw, zero.policy=TRUE)
summary(sar.chi)

# SAC model
sac.chi <- sacsarlm(Rischio_poverta ~ Bassa_intensita_lavoro +
                      Situazione_economica_della_famiglia +
                      Partecipazione_alla_formazione_continua +
                      Uscita_precoce_dal_sistema_di_istruzione_e_formazione,
                    data = poverta, listw, zero.policy=TRUE)
summary(sac.chi)

# Compare AIC
aic_results <- AIC(sar.chi, sac.chi)
capture.output(aic_results, file="results/models/AIC_comparison.txt")

# Impacts (direct and indirect)
W2 <- as(listw, "CsparseMatrix")
trMat <- trW(W2, type="mult")

impacts_sac <- impacts(sac.chi, tr=trMat, R=100)
capture.output(summary(impacts_sac, zstats=TRUE, short=TRUE), file="results/models/impacts_sac.txt")

sessionInfo()
