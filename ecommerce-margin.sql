WITH joined_table as (SELECT a.distributor_id, a.product_id, sum(o.no_units * o.sell_price) as revenue, 
sum(o.buy_price * o.no_units) as cost, sum((o.no_units * o.sell_price) - (o.buy_price * o.no_units)) as profit,
sum(no_units) as quantity
                      FROM allproducts a
                      JOIN orders o
                      On a.product_id=o.product_id
                      GROUP BY a.distributor_id, a.product_id
                      )
SELECT distributor_id, product_id, quantity, revenue, cost, profit ,RANK() OVER(ORDER BY revenue DESC), RANK() OVER(ORDER BY cost DESC),
       RANK() OVER(ORDER BY cost DESC)
from joined_table;