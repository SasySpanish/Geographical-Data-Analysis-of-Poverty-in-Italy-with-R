# 02_exploratory_analysis.R

library(rcompanion)
library(moments)
library(car)
library(lmtest)

# Descriptive statistics
summary(poverta$Rischio_poverta)

# Plots
png("results/plots/boxplot_poverty.png", width=800, height=600)
boxplot(poverta$Rischio_poverta, main="Boxplot - Poverty Risk")
dev.off()

png("results/plots/hist_poverty.png", width=800, height=600)
hist(poverta$Rischio_poverta, xlab="poverty risk levels", main="Distribution of Poverty Risk")
dev.off()

# Initial OLS regression
chi.ols <- lm(Rischio_poverta ~ Bassa_intensita_lavoro +
                Situazione_economica_della_famiglia +
                Occupati_non_regolari +
                Dipendenti_con_bassa_paga +
                Partecipazione_alla_formazione_continua +
                Uscita_precoce_dal_sistema_di_istruzione_e_formazione +
                Grave_deprivazione_materiale, 
              data = poverta)

summary(chi.ols)

# Reduced OLS model
chi.ols1 <- lm(Rischio_poverta ~ Bassa_intensita_lavoro + Partecipazione_alla_formazione_continua, data = poverta)
summary(chi.ols1)

# Diagnostics
shapiro.test(residuals(chi.ols1))
bptest(chi.ols1)
durbinWatsonTest(chi.ols1)

capture.output(summary(chi.ols1), file="results/models/ols_summary.txt")

sessionInfo()
