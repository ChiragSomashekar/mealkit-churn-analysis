SELECT
  CASE 
    WHEN churned = 0 THEN 'active'
    WHEN churned = 1 THEN 'churned'
  END AS churn_status,
  COUNT(customer_id) AS total_customers,
  ROUND(SUM(weeks_active * weekly_price), 2) AS total_lifetime_revenue,
  ROUND(AVG(weeks_active * weekly_price), 2) AS avg_lifetime_revenue 
FROM `subscribers`
GROUP BY churned
