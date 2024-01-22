1.Вывести сред/стоимость товаров из категорий 1, 2, 5, у которых название начинается с
 буквы t
 SELECT AVG(Price), ProductName
FROM Products
WHERE CategoryID in(1,2,5)
 AND ProductName Like 't%'

 2.Посчитать стоимость заказа 10248
 SELECT SUM(Price) 
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE OrderID =10248

3.Вывести ко-во товаров с ценой от 10 до 250 EUR
SELECT COUNT(*)
FROM Products
WHERE Price BETWEEN 10 AND 250

4.Вывести сумму, на которую было отправлено
товаров клиентам в Germany
SELECT SUM(OrderDetails.Quantity * Products.Price) AS Total
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Country = 'Germany';