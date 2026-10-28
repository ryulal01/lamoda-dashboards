SELECT p.category, SUM(s.views) AS views, SUM(s.orders) AS orders,
ROUND(SUM(s.revenue_rub),2) AS revenue_rub,
ROUND(100.0*SUM(s.orders)/NULLIF(SUM(s.views),0),2) AS view_to_order_pct
FROM product_daily_stats s JOIN products p USING(product_id)
WHERE s.event_date >= DATE '2024-01-01' AND s.event_date < DATE '2025-01-01'
GROUP BY p.category ORDER BY revenue_rub DESC;
