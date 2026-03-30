-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 01: Data Validation
-- ============================================================

-- Check 1: Total row count (expected: 1470)
SELECT COUNT(*) AS total_employees
FROM employee_attrition;

-- Check 2: Confirm attrition column values
SELECT DISTINCT Attrition, COUNT(*) AS count
FROM employee_attrition
GROUP BY Attrition;

-- Check 3: Null check on key columns (expected: all zeros)
SELECT
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS null_attrition,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS null_income,
    SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS null_overtime,
    SUM(CASE WHEN JobSatisfaction IS NULL THEN 1 ELSE 0 END) AS null_jobsat,
    SUM(CASE WHEN YearsAtCompany IS NULL THEN 1 ELSE 0 END) AS null_tenure
FROM employee_attrition;

-- Check 4: Numeric range sanity check
SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income,
    MIN(JobSatisfaction) AS min_jobsat,
    MAX(JobSatisfaction) AS max_jobsat,
    MIN(YearsAtCompany) AS min_tenure,
    MAX(YearsAtCompany) AS max_tenure
FROM employee_attrition;

-- Check 5: Confirm constant columns carry no analytical value
SELECT
    MIN(EmployeeCount), MAX(EmployeeCount),
    MIN(StandardHours), MAX(StandardHours)
FROM employee_attrition;

SELECT DISTINCT Over18 FROM employee_attrition;
