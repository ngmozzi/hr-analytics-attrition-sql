-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 05: Attrition by Tenure and Promotion Gap
-- ============================================================

-- Attrition by years at company
SELECT
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '1. Early (0-2 yrs)'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '2. Developing (3-5 yrs)'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '3. Established (6-10 yrs)'
        WHEN YearsAtCompany > 10 THEN '4. Veteran (10+ yrs)'
    END AS tenure_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition
GROUP BY tenure_band
ORDER BY tenure_band;

-- Attrition by years since last promotion
SELECT
    CASE
        WHEN YearsSinceLastPromotion BETWEEN 0 AND 1 THEN '1. Recently Promoted (0-1 yrs)'
        WHEN YearsSinceLastPromotion BETWEEN 2 AND 4 THEN '2. Moderate Gap (2-4 yrs)'
        WHEN YearsSinceLastPromotion >= 5 THEN '3. Long Gap (5+ yrs)'
    END AS promotion_gap,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    1) AS attrition_rate_pct
FROM employee_attrition
GROUP BY promotion_gap
ORDER BY promotion_gap;
