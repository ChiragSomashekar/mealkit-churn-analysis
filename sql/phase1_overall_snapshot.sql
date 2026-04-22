-- Phase 1: Overall snapshot
-- Question: What does the overall subscriber base look like?

SELECT
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned) * 100, 2) AS churn_rate,
  ROUND(AVG(weekly_price), 2) AS avg_weekly_price,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active,
  ROUND(AVG(nps), 2) AS avg_nps,
  ROUND(AVG(skip_rate) * 100, 2) AS avg_skip_rate
FROM `subscribers`
