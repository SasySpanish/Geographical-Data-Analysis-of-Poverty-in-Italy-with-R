# Geographical Data Analysis of Poverty in Italy

This project explores poverty in Italy through a geographical and statistical perspective, using data from ISTAT and BES (Benessere Equo e Sostenibile).  
The analysis combines descriptive statistics, spatial autocorrelation tests, and spatial regression models to highlight territorial inequalities and socio-economic drivers of poverty.

---

## Objectives
- Analyze the risk of poverty across Italian regions
- Study socio-economic differences using BES indicators
- Apply spatial autocorrelation tests (Moran’s I, Geary’s C)
- Compare spatial regression models (SAR, SAC)

---

## Project Structure
│── poverty-analysis-italy/
│── data/ # Datasets (ISTAT/BES). If not shareable, provide links in README
│── scripts/ # R code for each step of the analysis
│ │── 01_data_cleaning.R
│ │── 02_exploratory_analysis.R
│ │── 03_spatial_analysis.R
│ │── 04_models.R
│── results/ # Plots, maps, model outputs
│── report/ # Final slides or written report
│── README.md # Project documentation
│── requirements.txt # List of required R libraries

---

## Technologies
- **Language**: R  
- **Main Libraries**:  
  - `sf` – spatial data handling  
  - `spdep` – spatial dependence models  
  - `ggplot2` – data visualization  
  - `dplyr` – data wrangling  

---

## Key Results
- Strong territorial divide between Northern and Southern Italy in terms of poverty risk  
- Moran’s I ≈ 0.72 → strong spatial autocorrelation detected  
- **SAC model** outperformed SAR (lower AIC score)  
- Policy implications connected to PNRR and European Pillar of Social Rights  

---

## How to Reproduce
1. Clone this repository  
2. Install the required R packages listed in `requirements.txt`  
3. Run the scripts in the `scripts/` folder in order:  
   - `01_data_cleaning.R`  
   - `02_exploratory_analysis.R`  
   - `03_spatial_analysis.R`  
   - `04_models.R`  

---

## References
- ISTAT – Italian National Institute of Statistics  
- BES Project – Equitable and Sustainable Well-being indicators  
- European Pillar of Social Rights (EPSR)  
- Italian National Recovery and Resilience Plan (PNRR)  

---

## Authors
- F.Cecere  
- G.Masiello  
- S.Spagnuolo  
