SELECT p.product_id,p.product_name,p.category,p.brand,SUM(s.views) AS views,
SUM(s.orders) AS orders,ROUND(SUM(s.revenue_rub),2) AS revenue_rub
FROM product_daily_stats s JOIN products p USING(product_id)
WHERE s.event_date >= DATE '2024-01-01' AND s.event_date < DATE '2025-01-01'
GROUP BY p.product_id,p.product_name,p.category,p.brand ORDER BY revenue_rub DESC LIMIT 10;
