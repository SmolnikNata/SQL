--Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов
--(проекция: название_компании, ко-во заказов)
SELECT Shippers.ShipperName,COUNT(*) AS quantity_order
FROM Orders
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
Group by Orders.ShipperID
HAVING quantity_order >= 250

--Вывести заказы, где ко-во товаров 3 и более 
--(проекция: номерзаказа, ко-вотовароввзаказе)
SELECT OrderID,Quantity
FROM OrderDetails
GROUP BY OrderID
HAVING Quantity >=3

--Вывести минимальную стоимость товара для каждой категории, 
--кроме категории 2 (проекция: названиекатегории, минстоимость_товара)
SELECT  Categories.CategoryName, MIN(Products.Price) AS min_price
FROM  Products 
JOIN Categories  ON Products.CategoryID = Categories.CategoryID
WHERE 
   Categories.CategoryID != 2
GROUP BY  Categories.CategoryName

--Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов 
--(проекция: фамилия менеджера, к-во созданных_заказов)
SELECT  Employees.LastName,COUNT(*) AS sum_orders
FROM Orders
Join Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Orders.EmployeeID
ORDER BY sum_orders DESC
LIMIT 1 Offset 3 


--Вывести данные о товарах от поставщиков 4 и 8 (проекция: все имеющиеся поля,
-- цена со скидкой 1.5 процента, цена с наценкой 0.5 процента)
SELECT * ,Price * 0.985 AS price_down,Price * 1.005 AS price_up
FROM Products
WHERE SupplierID in(4,8)

                