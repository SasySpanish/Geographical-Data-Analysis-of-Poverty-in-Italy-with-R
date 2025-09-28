## Workflow

The project is structured into 5 main scripts.  
Each script corresponds to a specific step of the analysis.

---

### 1. `01_data_preparation.R` – Data loading and cleaning
- **Purpose**: Import the Italian NUTS2 shapefile and the poverty dataset, merge them into a single spatial object, and prepare data for analysis.  
- **Main tasks**:
  - Load shapefile with `st_read()`
  - Load poverty data (`poverta.csv`)
  - Merge datasets on NUTS2 codes
  - Clean and rename problematic column names
  - Quick map visualization with `mapview()`
  - Check dataset structure with `str()` and `summary()`
- **Output**: merged spatial dataset (`results/merged_poverty.geojson`)

---

### 2. `02_exploratory_analysis.R` – Descriptive statistics and OLS
- **Purpose**: Explore the distribution of poverty risk and estimate preliminary OLS models.  
- **Main tasks**:
  - Descriptive statistics and plots (boxplot, histogram, normality check)
  - Initial OLS regression with all predictors
  - Reduced OLS model with selected predictors
  - Model diagnostics:
    - Multicollinearity (VIF)
    - Residual normality (`shapiro.test`)
    - Heteroskedasticity (`bptest`)
    - Autocorrelation (`durbinWatsonTest`)
- **Output**: plots (`results/plots/`), OLS summary (`results/models/ols_summary.txt`)

---

### 3. `03_spatial_weights.R` – Spatial weight matrices
- **Purpose**: Build neighborhood structures and spatial weight matrices.  
- **Main tasks**:
  - Create adjacency lists:
    - **Queen contiguity** (`poly2nb(..., queen=TRUE)`)
    - **Rook contiguity** (`poly2nb(..., queen=FALSE)`)
  - Build spatial weights with `nb2listw()`
  - Visualize adjacency (Queen vs Rook)
  - Save weight matrix objects for later use
- **Output**: adjacency plots (`results/plots/queen_weights.png`), weights (`results/weights/listw_queen.rds`)

---

### 4. `04_spatial_tests.R` – Spatial autocorrelation tests
- **Purpose**: Test for spatial dependence and identify local clusters.  
- **Main tasks**:
  - Global Moran’s I (`moran.test`) → checks overall spatial autocorrelation  
  - Moran scatterplot → variable vs. spatial lag  
  - Geary’s C (`geary.test`) → alternative autocorrelation measure  
  - Local Moran’s I (LISA) → detect clusters (HH, LL, HL, LH)
  - Visualization of LISA clusters on the map
- **Output**: Moran/Geary results (`results/tests/`), LISA clusters (`results/tests/LISA.csv`), maps (`results/plots/moran_scatterplot.png`)

---

### 5. `05_spatial_models.R` – Spatial regression models
- **Purpose**: Estimate and compare spatial regression models.  
- **Main tasks**:
  - LM tests (`lm.LMtests`) to decide the most appropriate spatial model
  - Fit spatial models:
    - SAR (Spatial Autoregressive)
    - SEM (Spatial Error Model)
    - SAC (Spatial Autoregressive Combined)
  - Compare models with AIC → **SAC chosen** (lowest AIC)
  - Compute direct, indirect, and total effects (`impacts`)
- **Output**: model summaries (`results/models/`), AIC comparison (`results/models/AIC_comparison.txt`), impacts (`results/models/impacts_sac.txt`)

---

### 🔑 Key [Results](results/readme.md)
- **Moran’s I ≈ 0.72** → strong positive spatial autocorrelation in poverty risk  
- Clear North–South divide: High–High clusters in the South, Low–Low clusters in the North  
- **SAC model** best explains spatial dynamics (lowest AIC, significant results)  
- Results connect to policy frameworks like the PNRR and the European Pillar of Social Rights
