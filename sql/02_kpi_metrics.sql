SELECT SUM(views) AS views, SUM(product_clicks) AS product_clicks,
SUM(add_to_cart) AS add_to_cart, SUM(orders) AS orders, ROUND(SUM(revenue_rub),2) AS revenue_rub,
ROUND(100.0*SUM(product_clicks)/NULLIF(SUM(views),0),2) AS ctr_pct,
ROUND(100.0*SUM(orders)/NULLIF(SUM(views),0),2) AS view_to_order_pct
FROM product_daily_stats WHERE event_date >= DATE '2024-01-01' AND event_date < DATE '2025-01-01';
