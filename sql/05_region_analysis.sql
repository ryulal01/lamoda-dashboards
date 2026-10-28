SELECT region, SUM(views) AS views, SUM(orders) AS orders,
ROUND(SUM(revenue_rub),2) AS revenue_rub,
ROUND(100.0*SUM(orders)/NULLIF(SUM(views),0),2) AS view_to_order_pct
FROM product_daily_stats WHERE event_date >= DATE '2024-01-01' AND event_date < DATE '2025-01-01'
GROUP BY region ORDER BY revenue_rub DESC;
