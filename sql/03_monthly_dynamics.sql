SELECT DATE_TRUNC('month',event_date)::date AS month, SUM(views) AS views,
SUM(product_clicks) AS clicks, SUM(add_to_cart) AS add_to_cart, SUM(orders) AS orders,
ROUND(SUM(revenue_rub),2) AS revenue_rub
FROM product_daily_stats WHERE event_date >= DATE '2024-01-01' AND event_date < DATE '2025-01-01'
GROUP BY 1 ORDER BY 1;
