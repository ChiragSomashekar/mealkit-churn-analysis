-- Phase 4: Churn by weeks active
-- Question: Does being active for longer influence churn rates?

SELECT
  CASE 
    WHEN weeks_active <= 20 THEN '0-20 weeks'
    WHEN weeks_active <= 40 THEN '21-40 weeks'
    WHEN weeks_active <= 60 THEN '41-60 weeks'
    WHEN weeks_active <= 80 THEN '61-80 weeks'
    ELSE '81+ weeks'
  END AS weeks_active_bucket,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned*100), 2) AS churn_rate
FROM `subscribers`
GROUP BY weeks_active_bucket
ORDER BY churn_rate DESC
