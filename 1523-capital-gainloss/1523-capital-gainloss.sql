    SELECT t1.stock_name, sell_price - buy_price AS capital_gain_loss 
    FROM (
      SELECT stock_name, operation, SUM(price) as buy_price
      FROM Stocks T1
      WHERE operation = 'Buy'
      GROUP BY stock_name, operation 
    )t1    
    LEFT JOIN (
      SELECT stock_name, operation, SUM(price) as sell_price
      FROM Stocks
      WHERE operation = 'Sell'
      GROUP BY stock_name, operation
    )t2
      ON t1.stock_name = t2.stock_name

