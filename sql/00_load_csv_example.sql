-- Run these \copy commands in interactive psql from the repository root.
\copy products(product_id,product_name,category,brand,price_rub,stock_status) FROM 'data/products.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
\copy product_daily_stats(product_id,event_date,views,product_clicks,add_to_cart,orders,revenue_rub,region,channel) FROM 'data/product_daily_stats.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
