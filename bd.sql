--Вывести среднюю стоимость товара в категории 1 
--(проекция: название_категории, сред/стоимость)
SELECT Categories.CategoryName, AVG(Products.Price) AS avgPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryID = 1;

--Вывести телефоны поставщиков (suppliers) и перевозчиков (shippers)
SELECT Shippers.Phone AS ShipperPhone, Suppliers.Phone AS SupplierPhone
FROM Orders
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

--Вывести все заказы, добавив поле is_premium, если его доставит перевозчик 3 (ShipperID)
SELECT OrderID,
CASE
WHEN ShipperID =3 THEN 'premium'
END AS is_premium
FROM Orders

--Вывести все товары, причем для товаров от поставщиков 1 и 3 и ценой до 250 EUR
-- добавить скидку в 5.5% (проекция: все поля + поле Price_down)
SELECT *,
CASE
WHEN 
Price <= 250 AND SupplierID in(1,3) THEN Price*0.945
END AS PRISE_down
FROM Products 

