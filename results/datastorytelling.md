# Poverty Risk Analysis in Italy

This project explores the **determinants and spatial dynamics of poverty risk** across Italian regions, using regression analysis and spatial econometric methods.

---

## Regression Analysis
The linear regression model identifies the main drivers of poverty risk:

- **Low work intensity**: strong positive and highly significant effect. Regions with lower labor intensity show higher poverty risk.  
- **Household economic situation**: negative and significant. Better family economic conditions reduce poverty risk.  
- **Continuous training participation**: negative and significant. Lifelong learning acts as a protective factor against poverty.  
- **Early school leaving**: positive and significant. Dropping out of education increases poverty risk.  

The model shows excellent fit (**Adjusted R² = 0.98**), confirming that these socio-economic variables explain most of the variance in poverty risk.

---

## Spatial Effects (SAC Model)
The spatial autoregressive model highlights that poverty is **not randomly distributed**, but spreads across neighboring regions:

- **Low work intensity**: strong positive direct effect, but negative indirect effect on neighboring areas (suggesting compensatory dynamics).  
- **Household economic situation**: positive indirect effect, meaning economic hardship in one region tends to spill over into adjacent areas.  

These findings imply the need for **coordinated regional policies**, since poverty dynamics do not stop at administrative borders.

---

## Spatial Autocorrelation (Moran’s I and Local Moran)
- **Moran’s I = 0.72** → strong positive spatial autocorrelation. High-poverty regions cluster together, as do low-poverty regions.  
- **LISA Cluster Map**:
  - **High-High cluster**: Southern Italy (critical poverty risk hotspot).  
  - **Low-Low cluster**: Northern Italy (low poverty risk concentration).  
  - No regions fall into **Low-High** or **High-Low** outliers.  

---

## Conclusions
- Poverty risk in Italy is **strongly linked to labor conditions, household economy, and education**.  
- The phenomenon has a **clear spatial dimension**, with persistent **North-South disparities**.  
- Policy recommendations:
  - Invest in **quality employment** and **lifelong learning**.  
  - Develop **interregional strategies**, since poverty spreads across territories.  



## Key Insight
Poverty in Italy is not only a **social issue**, but also a **spatial one**:  
it concentrates in specific areas and propagates across neighboring regions, calling for **comprehensive and territorial policies**.

