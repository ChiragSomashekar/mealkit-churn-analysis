SELECT
  acquisition_channel,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned)*100, 2) AS churn_rate,
  ROUND(AVG(weeks_active * weekly_price), 2) AS avg_lifetime_revenue,
  ROUND(SUM(weeks_active * weekly_price), 2) AS total_lifetime_revenue
FROM `project-pra-477112.hellofresh.subscribers`
GROUP BY acquisition_channel
ORDER BY total_lifetime_revenue DESC
