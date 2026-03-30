-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 04: Attrition by Monthly Income Band
-- ============================================================

-- Employees grouped into four income bands
-- Note: Floor set to $0 to capture five employees below dataset minimum of $1,099
SELECT
    CASE
        WHEN MonthlyIncome BETWEEN 0 AND 4999 THEN 'Entry Level'
        WHEN MonthlyIncome BETWEEN 5000 AND 9999 THEN 'Mid Level'
        WHEN MonthlyIncome BETWEEN 10000 AND 14999 THEN 'Senior Level'
        WHEN MonthlyIncome BETWEEN 15000 AND 19999 THEN 'Executive Level'
    END AS income_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition
GROUP BY income_band
ORDER BY attrition_rate_pct DESC;
