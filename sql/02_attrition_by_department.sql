-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 02: Attrition by Department
-- ============================================================

-- Overall attrition rate baseline
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition;

-- Attrition rate by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;
