# ETC5543-lihsuan-project

## Appointment Optimisation for Urgent-in-Time Model of Care

**Author:** Li-Hsuan Chung  
**Unit:** ETC5543 Business Analytics Creative Project  
**Institution:** Monash University  
**GitHub Repository:** [lihsuanchung/ETC5543-lihsuan-project](https://github.com/lihsuanchung/ETC5543-lihsuan-project)

---

## Project Overview

This project develops a transparent, reproducible workflow to optimise specialist clinic appointment templates under the **Urgent-in-Time Model of Care**.  
It aims to rebalance limited weekly capacity so that **urgent new patients** receive timely access while maintaining continuity for **semi-urgent and routine reviews**.

The study was conducted as part of a partnership with **Monash Health’s Business Intelligence team**.

---

## Analytical Pipeline

1. **Cross-clinic screening (26 clinics)**  
   Identify clinics most affected by template imbalance using five indicators:
   - Priority mix  
   - New-to-Review ratio  
   - Demand volume  
   - Urgent-New average wait time  
   - KPI 

2. **Forecasting demand (Clinic 2078B)**  
   Estimate total appointment demand for FY2026 using historical referral trends and review patterns.  
   - Models: ARIMA, ETS, TSLM, and Seasonal Naïve (SNAIVE)  
   - Best performer: **SNAIVE (MAPE = 6.27%)**

3. **Optimisation model**  
   Apply a **linear programming (LP)** model to allocate weekly capacity (39 slots) across six classes:  
   Urgent-New, Semi-urgent-New, Routine-New, and three Review categories.  
   - Objective: maximise weighted service  
   - Constraints: fixed capacity, review floors, new-share limits

4. **Backlog simulation (300 weeks)**  
   Simulate backlog evolution for each scenario:  
   - **Scenario A (UN=17)**: stabilises but does not clear backlog  
   - **Scenario B (UN=19)**: clears backlog in ~227 weeks (~4 years)  
   - **Scenario C (UN=24)**: clears backlog in ~65 weeks (~1.25 years)


## Repository Structure
ETC5543-lihsuan-project/
├── _extensions/quarto-monash/report/ # Monash Quarto extension for consistent report style
│
├── charts_fy2025_urology/ # Figures and charts used in the final report
│
├── data/ # Filtered and de-identified datasets (simulated for analysis)
│
├── report_cache/ # Temporary cache created during Quarto rendering
│
├── report_files/ # Supporting media files (images) used inside the report
│
├── sql/ # SQL scripts used to verify data volume and match internal property ID reports
│
├── report.qmd # Main Quarto analysis and report file
├── report.pdf # Final rendered report
├── README.md # This file – project overview and structure
└── LICENSE # MIT License for open-source use

## Reproducibility

- **R version:** 4.4.1  
- **Required packages:**  
  `tidyverse`, `tsibble`, `fable`, `lpSolve`, `lubridate`, `ggplot2`, `readr`,`dplyr`, `scales`,`forcats`,``
- **To reproduce the full report:**

## License

This project is released under the **MIT License**.  
You are free to use, copy, modify, and distribute the materials in this repository, provided that proper credit is given to the author.

See the full license text in the [LICENSE](LICENSE) file.