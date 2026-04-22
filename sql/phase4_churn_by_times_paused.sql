-- Phase 4: Churn by times paused
-- Question: Do pausing plan influence churn rates?

SELECT
  CASE 
    WHEN times_paused = 0 THEN 'Low'
    WHEN times_paused = 1 THEN 'Medium'
    WHEN times_paused = 2 THEN 'High'
    WHEN times_paused > 2 THEN 'Very High'
    ELSE 'Others'
  END AS times_paused_bucket,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned*100), 2) AS churn_rate,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active
FROM `subscribers`
GROUP BY times_paused_bucket
ORDER BY churn_rate
