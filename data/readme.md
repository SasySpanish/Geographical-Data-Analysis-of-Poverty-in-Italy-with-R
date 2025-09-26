# Data Documentation

This folder contains the input data used in the project *Geographical Data Analysis of Poverty in Italy*.  
It includes:

1. **poverta.csv** – socio-economic indicators from ISTAT/BES  
2. **NUTS2 shapefile** – geographical boundaries of Italian NUTS2 regions (Eurostat/ISTAT standard)

---

## 1. `poverta.csv`

The dataset provides regional-level indicators on poverty and socio-economic conditions in Italy.  
All data come from **ISTAT** (Italian National Institute of Statistics), mainly from the **EU-SILC survey** and the **BES project (Benessere Equo e Sostenibile)**.  

### Variables description

1. **Rischio di Povertà**  
   Percentage of people at risk of poverty, with an equivalent income below or equal to 60% of the national median.  
   *Domain*: Economic well-being  
   *Source*: ISTAT – EU-SILC survey  

2. **Bassa Intensità di Lavoro**  
   Percentage of people living in households where the ratio of total worked months (by members aged 18–59, excluding students aged 18–24) to the total theoretical months available for work is below 0.20.  
   *Domain*: Economic well-being  
   *Source*: ISTAT – EU-SILC survey  

3. **Situazione Economica delle Famiglie**  
   Percentage of households reporting that their economic situation has worsened or significantly worsened compared to the previous year.  
   *Domain*: Economic well-being  
   *Source*: ISTAT – Aspects of Daily Life survey  

4. **Occupati non regolari**  
   Percentage of irregular (undeclared) workers on total employment.  
   *Domain*: Labour and work-life balance  
   *Source*: ISTAT – National Accounts  

5. **Dipendenti con bassa paga**  
   Percentage of employees with an hourly wage below two-thirds of the median wage.  
   *Domain*: Labour and work-life balance  
   *Source*: ISTAT – Labour Force Survey  

6. **Partecipazione alla formazione continua**  
   Percentage of people aged 25–64 who attended education or training activities in the 4 weeks before the interview.  
   *Domain*: Education and training  
   *Source*: ISTAT – Labour Force Survey  

7. **Uscita precoce dal sistema di istruzione e formazione**  
   Percentage of people aged 18–24 with at most lower secondary education (no higher qualification) and not in training/education at the time of the survey.  
   *Domain*: Education and training  
   *Source*: ISTAT – Labour Force Survey  

8. **Grave deprivazione materiale**  
   Percentage of people living in households facing at least 4 out of 9 severe material deprivation conditions (e.g., arrears on rent or bills, inability to heat home adequately, no car, no washing machine, etc.).  
   *Domain*: Economic well-being  
   *Source*: ISTAT – EU-SILC survey  

---

## 2. NUTS2 Shapefile

The shapefile contains the geographical boundaries of the Italian **NUTS2 regions** (European Nomenclature of Territorial Units for Statistics).  

- **Source**: ISTAT / Eurostat  
- **Format**: standard shapefile (`.shp`, `.dbf`, `.shx`, etc.)  
- **Projection**: WGS 84 (EPSG:4326) unless otherwise specified  

This shapefile is used to perform spatial joins, build adjacency matrices (Queen and Rook contiguity), and produce regional maps of poverty risk and related indicators.

---

## About BES (Benessere Equo e Sostenibile)

The **BES project**, launched by ISTAT in 2010, aims to measure the *equitable and sustainable well-being* of Italian society.  
It goes beyond GDP by integrating traditional economic measures with indicators on quality of life, social cohesion, and environmental sustainability.  

BES indicators are grouped into **12 domains** (e.g., economic well-being, education, environment, health). Since 2013, ISTAT publishes an annual BES report to monitor progress and inform policy decisions.  
Since 2016, selected BES indicators are included in Italy’s Economic and Financial Document (DEF), linking them directly to public policy evaluation.

---

## Notes
- If redistribution of the raw ISTAT data is not permitted, please refer to the official [ISTAT BES portal](https://www.istat.it/en/well-being-and-sustainability) for downloads.  
- The shapefile may be obtained from [Eurostat GISCO](https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units) or ISTAT’s cartography portal.  

---
