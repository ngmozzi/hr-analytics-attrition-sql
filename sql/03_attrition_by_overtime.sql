-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 03: Attrition by Overtime
-- ============================================================

-- Attrition rate split by overtime status
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;
