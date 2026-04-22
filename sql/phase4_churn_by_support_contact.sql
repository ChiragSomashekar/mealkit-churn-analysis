-- Phase 4: Churn by contacting support
-- Question: Does contacting support influence churn rates?

SELECT
  CASE 
    WHEN support_contacts = 0 THEN 'Low'
    WHEN support_contacts = 1 THEN 'Medium'
    WHEN support_contacts = 2 THEN 'High'
    WHEN support_contacts > 2 THEN 'Very High'
    ELSE 'Others'
  END AS support_contacts_bucket,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned*100), 2) AS churn_rate,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active
FROM `subscribers`
GROUP BY support_contacts_bucket
ORDER BY churn_rate
