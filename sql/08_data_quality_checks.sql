-- These queries should return no rows.
SELECT * FROM product_daily_stats WHERE views < 0 OR product_clicks > views
 OR add_to_cart > product_clicks OR orders > add_to_cart;
SELECT product_id,event_date,region,channel,COUNT(*) FROM product_daily_stats
GROUP BY product_id,event_date,region,channel HAVING COUNT(*) > 1;
SELECT s.product_id FROM product_daily_stats s LEFT JOIN products p USING(product_id)
WHERE p.product_id IS NULL;
