-- Phase 4: Churn by skip rate
-- Question: Do skip rate influence churn rates?

SELECT
  CASE 
    WHEN skip_rate < 0.10 THEN 'Low (0-10%)'
    WHEN skip_rate < 0.25 THEN 'Medium (10-25%)'
    WHEN skip_rate < 0.50 THEN 'High (25-50%)'
    ELSE 'Very High (50%+)'
  END AS skip_rate_bucket,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned*100), 2) AS churn_rate,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active
FROM `subscribers`
GROUP BY skip_rate_bucket
ORDER BY skip_rate_bucket
