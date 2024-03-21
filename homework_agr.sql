*/Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT(*) AS suppliers
FROM Suppliers
WHERE NOT Country IN ('UK', 'China')

*/Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT MIN(Price)AS min_price, MAX(Price) AS max_price,AVG(Price) AS avg_price 
FROM Products
WHERE CategoryID IN (3,5)

*/Вывести общую сумму проданных товаров
SELECT SUM(Price*Quantity)
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID= Products.ProductID

*/Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
SELECT Orders.OrderID, Customers.CustomerName,Customers.Country,Employees.LastName AS Employee_lastName,Shippers.ShipperName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
Join Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID =Shippers.ShipperID

*/Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(Products.Price * OrderDetails.Quantity) AS sum_for_Germany
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID =Customers.CustomerID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Country ='Germany'
