# 02_exploratory_analysis.R

library(rcompanion)
library(moments)
library(car)
library(lmtest)

data <- read_csv("poverta.csv")

poverta=data
# Descriptive statistics
summary(poverta$Rischio_poverta)

# Plots
png("results/plots/boxplot_poverty.png", width=800, height=600)
boxplot(poverta$Rischiopoverta, main="Boxplot - Poverty Risk")
dev.off()

png("results/plots/hist_poverty.png", width=800, height=600)
hist(poverta$Rischiopoverta, xlab="poverty risk levels", main="Distribution of Poverty Risk")
dev.off()

# Initial OLS regression
chi.ols <- lm(Rischiopoverta ~ Bassaintensitalavoro +
                Situazioneeconomicadellafamiglia +
                Occupatinonregolari +
                Dipendenticonbassapaga +
                Partecipazioneallaformazionecontinua +
                Uscitaprecocedalsistemadiistruzioneeformazione,
              data = poverta)

summary(chi.ols)

# Reduced OLS model
chi.ols1 <- lm(Rischiopoverta ~ Bassaintensitalavoro + Partecipazioneallaformazionecontinua, data = poverta)
summary(chi.ols1)

# Diagnostics
shapiro.test(residuals(chi.ols1))
bptest(chi.ols1)
durbinWatsonTest(chi.ols1)

capture.output(summary(chi.ols1), file="results/models/ols_summary.txt")

library(ggplot2)
library(reshape2)
library(corrplot)

# Seleziona solo le variabili numeriche
num_data <- poverta[, c("Rischiopoverta",
                        "Bassaintensitalavoro",
                        "Situazioneeconomicadellafamiglia",
                        "Occupatinonregolari",
                        "Dipendenticonbassapaga",
                        "Partecipazioneallaformazionecontinua",
                        "Uscitaprecocedalsistemadiistruzioneeformazione")]

# Calcola matrice di correlazione
corr_matrix <- cor(num_data)

# Plot con corrplot
corrplot(corr_matrix, method = "color", addCoef.col = "black", tl.cex = 0.8)

#solution
num_data_short <- num_data
colnames(num_data_short) <- c(
  "Pov",
  "LowW",
  "EFam",
  "IrW",
  "LowP",
  "Train",
  "ELea"
)

# Calcola matrice di correlazione
corr_matrix <- cor(num_data_short)

# Plot con corrplot
library(corrplot)
corrplot(corr_matrix, method = "color", addCoef.col = "black", tl.cex = 0.8)


#####
library(GGally)

# Scatter plot matrix con regressione lineare
ggpairs(num_data,
        columns = 2:7,  # variabili esplicative
        mapping = ggplot2::aes(color = Rischiopoverta),
        upper = list(continuous = wrap("cor", size = 3)),
        lower = list(continuous = wrap("smooth", method = "lm")))

# ggplot
ggplot(poverta, aes(x = Bassaintensitalavoro, y = Rischiopoverta)) +
  geom_point(color = "steelblue", size = 2) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Low Work Intensity vs Poverty",
       x = "Low Work Intensity",
       y = "Poverty Risk (%)") +
  theme_minimal()
