-- Phase 3: Cohort analysis by signup month
-- Question: Does when a customer signed up affect how long they stay?

SELECT
  DATE_TRUNC(signup_date, MONTH) AS signup_month,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned)* 100, 2) AS churn_rate,
  ROUND(AVG(weeks_active), 2) AS avg_weeks_active,
  ROUND(AVG(weekly_price), 2) AS avg_weekly_price,
  ROUND(AVG(weeks_active)* AVG(weekly_price), 2) AS LTV
FROM `subscribers`
GROUP BY DATE_TRUNC(signup_date, MONTH)
ORDER BY DATE_TRUNC(signup_date, MONTH);
