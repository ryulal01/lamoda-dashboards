CREATE TABLE IF NOT EXISTS products (
 product_id INTEGER PRIMARY KEY, product_name TEXT NOT NULL, category TEXT NOT NULL,
 brand TEXT NOT NULL, price_rub NUMERIC(12,2) NOT NULL CHECK(price_rub >= 0),
 stock_status TEXT NOT NULL CHECK(stock_status IN ('in_stock','low_stock','out_of_stock'))
);
CREATE TABLE IF NOT EXISTS product_daily_stats (
 product_id INTEGER NOT NULL REFERENCES products(product_id), event_date DATE NOT NULL,
 views INTEGER NOT NULL CHECK(views >= 0), product_clicks INTEGER NOT NULL CHECK(product_clicks >= 0),
 add_to_cart INTEGER NOT NULL CHECK(add_to_cart >= 0), orders INTEGER NOT NULL CHECK(orders >= 0),
 revenue_rub NUMERIC(14,2) NOT NULL CHECK(revenue_rub >= 0), region TEXT NOT NULL, channel TEXT NOT NULL,
 PRIMARY KEY(product_id,event_date,region,channel),
 CHECK(product_clicks <= views), CHECK(add_to_cart <= product_clicks), CHECK(orders <= add_to_cart)
);
CREATE INDEX IF NOT EXISTS idx_product_stats_date ON product_daily_stats(event_date);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);
