--1.Вывести заказы со стоимостью от 5000 EUR (проекция: 
--номер_заказа, стоимость_заказа)

SELECT Orders.OrderId, SUM(Products.Price*OrderDetails.Quantity) As price_orders
FROM Orders
JOIN OrderDetails ON OrderDetails.OrderID=Orders.OrderID
JOIN 	Products ON OrderDetails.ProductID= Products.ProductID
GROUP BY Orders.OrderID
HAVING price_orders >=5000

--2.Вывести страны, в которые было отправлено 3 и более заказов
SELECT Customers.Country,COUNT(Orders.OrderID)AS order_country 
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
HAVING  order_country>= 3
ORDER BY  order_country 
--2.2 Можно ли зап сать так?
SELECT Customers.Country,COUNT(Orders.OrderID)AS order_country 
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.Country
HAVING  order_country>= 3
ORDER BY  order_country  

--3.Вывести ТОП-10 самых продаваемых товаров
--(проекция: название_товара, ко_во_проданных_единиц)
SELECT Products.ProductName, SUM(OrderDetails.Quantity)AS quantity_count
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
GROUP BY Products.ProductName
ORDER BY quantity_count DESC
LIMIT 10
 
--4.Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT Employees.LastName, SUM(OrderDetails.Quantity*Products.Price)* 0.05 AS salary_employees
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.LastName
