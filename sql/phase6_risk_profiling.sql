WITH warning_signal AS (
  SELECT
    customer_id,
    (CASE WHEN skip_rate > 0.1 THEN 1 ELSE 0 END +
     CASE WHEN support_contacts >= 2 THEN 1 ELSE 0 END +
     CASE WHEN delivery_issues >= 2 THEN 1 ELSE 0 END +
     CASE WHEN times_paused >= 2 THEN 1 ELSE 0 END +
     CASE WHEN weeks_active < 40 THEN 1 ELSE 0 END) AS risk_score
  FROM `subscribers`
),

bucketed_risk AS (
  SELECT
    customer_id,
    CASE
      WHEN risk_score = 0 THEN 'low risk'
      WHEN risk_score = 1 THEN 'Medium risk'
      WHEN risk_score BETWEEN 2 AND 3 THEN 'High risk'
      ELSE 'Critical'
    END AS risk_tiers
  FROM warning_signal
),

final AS (
  SELECT
    b.customer_id,
    b.risk_tiers,
    s.churned,
    s.weekly_price,
    s.weeks_active
  FROM bucketed_risk b
  JOIN `subscribers` s
    ON b.customer_id = s.customer_id
)

SELECT 
  risk_tiers,
  COUNT(customer_id) AS total_customers,
  ROUND(AVG(churned) * 100, 2) AS churn_rate,
  ROUND(AVG(weekly_price), 2) AS avg_weekly_price,
  ROUND(AVG(weeks_active * weekly_price), 2) AS avg_ltv
FROM final
GROUP BY risk_tiers
ORDER BY churn_rate DESC
