--1.Вывести стоимость заказа 10258
SELECT OrderDetails.OrderID, SUM(Products.Price*OrderDetails.Quantity) AS total_sum
FROM OrderDetails
Join Products ON OrderDetails.ProductID = Products.ProductID
Where OrderDetails.	OrderID = 10258

--2.Вывести кол/распределение заказов по клиентам
-- (проекция: имя клиента, ко-во заказов)
SELECT Customers.CustomerName,COUNT(*) AS total_orders
FROM Orders
JOIN Customers ON  Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CustomerID

--3.Вывести кол/распределение заказов по менеджерам 
--(проекция: фамилия менеджера, ко-возаказов)
SELECT Employees.LastName,COUNT(*) AS total_orders
FROM Orders
JOIN Employees ON  Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID

--4.Вывести минимальную стоимость товаров для каждой категории
-- (проекция: название категории, минстоимость_товаров)
SELECT Categories.CategoryName, MIN( Products.Price) AS min_price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID

--5.Вывести данные о заказах
-- (проекция: номерзаказа, стоимостьзаказа)
SELECT OrderDetails.OrderDetailID, SUM( Products.Price * OrderDetails.Quantity)
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.OrderDetailID
--6.Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от
-- суммы его заказов (проекция: фамилия_менеджера, доход)
SELECT Employees.LastName, 
       SUM(Products.ProductID * OrderDetails.Quantity * 0.05) AS salary
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Employees.LastName