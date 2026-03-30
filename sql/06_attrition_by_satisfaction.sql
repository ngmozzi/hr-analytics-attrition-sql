-- ============================================================
-- HR Analytics: Attrition Patterns in Workforce Data
-- File 06: Attrition by Satisfaction Scores
-- ============================================================

-- Average satisfaction scores compared between leavers and stayers
-- All scores rated on a 1-4 scale
SELECT
    Attrition,
    ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction,
    ROUND(AVG(EnvironmentSatisfaction), 2) AS avg_env_satisfaction,
    ROUND(AVG(RelationshipSatisfaction), 2) AS avg_relationship_satisfaction,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM employee_attrition
GROUP BY Attrition
ORDER BY Attrition DESC;
