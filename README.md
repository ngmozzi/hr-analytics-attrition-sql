(**Phase 2:** [Predictive Attrition Model (Python/scikit-learn)](https://github.com/ngmozzi/hr-analytics-attrition-model))

# Exploratory People Analytics: Identifying Attrition Patterns in Workforce Data

## Project Overview

This project uses SQL to analyze the IBM HR Analytics Attrition dataset, a synthetic 
workforce dataset containing records for 1,470 employees across multiple departments, 
roles, and compensation levels. The goal was to identify patterns associated with 
employee attrition by examining variables including overtime, monthly income, tenure, 
satisfaction scores, and business travel frequency.

Analysis was conducted entirely in MySQL using structured query language. Each business 
question was approached with the intent of producing findings that are honest, 
interpretable, and appropriately limited in their claims. This project does not attempt 
predictive modeling. It is an exploratory analysis designed to surface meaningful 
workforce patterns and communicate them clearly.

**Tools:** MySQL, MySQL Workbench  
**Dataset:** [IBM HR Analytics Employee Attrition and Performance](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) (via Kaggle)

---

## Data Validation

Prior to analysis, the dataset was reviewed to confirm integrity and reliability.

- **Row count:** 1,470 records confirmed
- **Attrition values:** Column contained only "Yes" (237) and "No" (1,233) with no 
  formatting inconsistencies
- **Null check:** No null values detected across key columns (Attrition, MonthlyIncome, 
  OverTime, JobSatisfaction, YearsAtCompany)
- **Numeric ranges:** All fields returned realistic values with no out-of-range outliers
- **Constant columns excluded:** EmployeeCount, Over18, and StandardHours confirmed as 
  constants and removed from analysis

---

## Business Questions

1. What is the overall attrition rate, and how does it compare across departments?
2. Do employees who work overtime leave at higher rates than those who don't?
3. How does attrition vary by monthly income level?
4. How does attrition relate to years at the company and years since last promotion?
5. Do satisfaction scores differ between employees who stayed and employees who left?
6. How does attrition vary by business travel frequency?
7. Are there combinations of risk factors that appear together among employees who left?

---

## Key Findings

- **Overall attrition rate:** 16.1% of employees experienced attrition. The Sales 
  department showed the highest departmental rate at 20.6%, above the company baseline.

- **Overtime is the strongest single-factor signal:** Employees working overtime left 
  at 30.5%, nearly three times the rate of non-overtime employees (10.4%).

- **Income level shows an inverse relationship with attrition:** Entry level employees 
  (under $5,000/month) showed a 21.8% attrition rate compared to 3.8% among executive 
  level employees.

- **Early tenure is a critical vulnerability window:** Employees within their first two 
  years showed a 29.8% attrition rate, more than double that of employees with three or 
  more years at the company.

- **Satisfaction scores showed modest but consistent gaps:** Employees who left rated 
  job satisfaction and environment satisfaction approximately 0.31 points lower on a 
  4-point scale, suggesting dissatisfaction alone is not the primary attrition driver.

- **Frequent business travel correlates with higher attrition:** Frequent travelers 
  showed a 24.9% attrition rate compared to 8.0% among non-travelers.

- **Risk factors compound significantly:** A risk scoring model revealed that employees 
  with zero risk factors showed 6.0% attrition while employees with all four risk 
  factors showed 75.0% attrition, demonstrating a dramatic compounding effect.

---

## Limitations

- **Causation cannot be established:** All findings describe associations, not causal 
  relationships. Controlled experimentation would be required to establish causation.
- **Synthetic data constraints:** This dataset was created for educational purposes and 
  may not reflect patterns in real organizational data.
- **Reverse causality in satisfaction scores:** Employees who decided to leave may have 
  rated satisfaction lower as a result of that decision rather than as a cause of it.
- **Unmeasured variables:** The dataset does not include exit interview data, manager 
  quality, team dynamics, or external job market conditions.
- **Headcount differences:** Small subgroups such as the HR department are more 
  sensitive to individual departures and should be interpreted cautiously.

---

## Next Steps

- **Segmented risk analysis:** Re-running the risk factor model within individual 
  departments to identify where compounding factors concentrate
- **Visualization:** Translating findings into dashboards using Tableau or Power BI
- **Predictive modeling:** Applying logistic regression or decision tree models to move 
  from descriptive to probabilistic attrition prediction
- **Engagement survey integration:** Pairing attrition analysis with pulse survey data 
  for more timely organizational insights
