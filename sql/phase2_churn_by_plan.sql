-- Phase 2: Churn by plan 
-- Question: Does plan predict churn?

SELECT
  plan_type,
  COUNT(*) AS total_customers,
  ROUND(AVG(churned)*100, 2) AS churn_rate,
  ROUND(AVG(weekly_price), 2) AS avg_weekly_price,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active,
  ROUND(AVG(weekly_price) * AVG(weeks_active), 2) AS LTV
FROM `subscribers`
GROUP BY plan_type
ORDER BY churn_rate DESC
