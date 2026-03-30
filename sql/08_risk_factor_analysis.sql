-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 08: Risk Factor Combination Analysis
-- ============================================================

-- Risk factors identified from previous queries:
--   Overtime = Yes (30.5% attrition vs 10.4%)
--   Monthly Income in Entry Level band (21.8% attrition)
--   Years at Company 0-2, Early tenure (29.8% attrition)
--   Business Travel = Frequently (24.9% attrition)
--
-- Each employee receives a risk score of 0-4 based on how many
-- risk factors apply to them. Attrition rate is then calculated
-- per risk score group to reveal compounding effects.

WITH risk_flags AS (
    SELECT
        EmployeeNumber,
        Attrition,
        CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END AS flag_overtime,
        CASE WHEN MonthlyIncome BETWEEN 0 AND 4999 THEN 1 ELSE 0 END AS flag_low_income,
        CASE WHEN YearsAtCompany BETWEEN 0 AND 2 THEN 1 ELSE 0 END AS flag_early_tenure,
        CASE WHEN BusinessTravel = 'Travel_Frequently' THEN 1 ELSE 0 END AS flag_travel,
        CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN MonthlyIncome BETWEEN 0 AND 4999 THEN 1 ELSE 0 END +
        CASE WHEN YearsAtCompany BETWEEN 0 AND 2 THEN 1 ELSE 0 END +
        CASE WHEN BusinessTravel = 'Travel_Frequently' THEN 1 ELSE 0 END
        AS risk_score
    FROM employee_attrition
)
SELECT
    risk_score,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM risk_flags
GROUP BY risk_score
ORDER BY risk_score ASC;
