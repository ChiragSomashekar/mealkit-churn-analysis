-- Phase 4: Churn by delivery issues
-- Question: Do delivery issues influence churn rates?

SELECT
  CASE 
    WHEN delivery_issues = 0 THEN 'Low'
    WHEN delivery_issues = 1 THEN 'Medium'
    WHEN delivery_issues = 2 THEN 'High'
    WHEN delivery_issues > 2 THEN 'Very High'
    ELSE 'Others'
  END AS delivery_issues_bucket,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned*100), 2) AS churn_rate,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active
FROM `subscribers`
GROUP BY delivery_issues_bucket
ORDER BY churn_rate
