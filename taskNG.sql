--Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)
SELECT Products.ProductName,Products.Price,Categories.CategoryName,Suppliers.SupplierName
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

--Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)
SELECT Orders.OrderID,Customers.CustomerName,Customers.Country
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE  NOT Customers.Country = 'France'

--Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT Products.ProductName,Products.Price * 1.08 AS USD_price
FROM OrderDetails
JOIN Products ON  OrderDetails.ProductID = Products.ProductID
ORDER BY Products.Price DESC
LIMIT 1

--Вывести список стран, которые поставляют морепродукты
SELECT Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Seafood'

--Вывести два самых дорогих товара из категории Beverages из USA
SELECT Products.ProductName,Products.Price,Suppliers.Country
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages'
AND Suppliers.Country = 'USA'
ORDER BY Products.Price DESC 
LIMIT 2


